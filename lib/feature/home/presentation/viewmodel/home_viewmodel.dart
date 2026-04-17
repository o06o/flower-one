import 'dart:async';

import 'package:flowerone/core/model/exception/flower_exception.dart';
import 'package:flowerone/core/model/model/flower_info_model.dart';
import 'package:flowerone/libraries/logger/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/app_messages.dart';
import '../../../letter/domain/provider/make_letter_usecase_provider.dart';
import '../../../recommend/data/mapper/flower_mapper.dart';
import '../../../recommend/domain/provider/get_recommend_flower_usecase_provider.dart';

part 'home_viewmodel.freezed.dart';
part 'home_viewmodel.g.dart';

enum ChatStep {
  initial,           // 초기 상태
  waitingRecommend,  // 추천 대기
  showRecommend,     // 추천 결과 + 액션 버튼
  selectFlower,      // 꽃 선택 대기
  selectRecipient,   // 수신자 선택 대기
  makingLetter,      // 편지 생성 중
  showLetter,        // 편지 결과 표시
}

@freezed
abstract class HomeChatMessage with _$HomeChatMessage {
  factory HomeChatMessage.text({
    required String text,
    @Default(false) bool isUser,
  }) = TextMessage;

  factory HomeChatMessage.flowerCards({
    required List<FlowerInfoModel> flowers,
  }) = FlowerCardsMessage;

  factory HomeChatMessage.actionButtons() = ActionButtonsMessage;

  factory HomeChatMessage.flowerSelection({
    required List<FlowerInfoModel> flowers,
  }) = FlowerSelectionMessage;

  factory HomeChatMessage.recipientSelection() = RecipientSelectionMessage;

  factory HomeChatMessage.loading() = LoadingMessage;
}

@freezed
abstract class HomeState with _$HomeState {
  factory HomeState({
    @Default([]) List<HomeChatMessage> messages,
    @Default(ChatStep.initial) ChatStep currentStep,
    @Default([]) List<FlowerInfoModel> recommendedFlowers,
    int? requestId,
    FlowerInfoModel? selectedFlower,
    String? selectedRecipient,
    String? userSituation,
    String? letterContent,
    @Default(AsyncData<void>(null)) AsyncValue<void> requestState,
  }) = _HomeState;

  factory HomeState.init() => HomeState(
        messages: [],
        currentStep: ChatStep.initial,
        recommendedFlowers: const [],
        requestId: null,
        selectedFlower: null,
        selectedRecipient: null,
        userSituation: null,
        letterContent: null,
        requestState: const AsyncData<void>(null),
      );
}

@Riverpod(keepAlive: false)
class HomeViewModel extends _$HomeViewModel {
  final _messagesController = StreamController<List<HomeChatMessage>>.broadcast();
  List<HomeChatMessage> _messages = [];

  @override
  HomeState build() {
    ref.onDispose(() {
      _messagesController.close();
    });
    return HomeState.init();
  }

  Stream<List<HomeChatMessage>> get messagesStream => _messagesController.stream;

  void _addMessage(HomeChatMessage message) {
    _messages = [..._messages, message];
    _messagesController.add(_messages);
    state = state.copyWith(messages: _messages);
  }

  void _replaceLastMessage(HomeChatMessage message) {
    if (_messages.isEmpty) {
      _addMessage(message);
      return;
    }
    _messages = [..._messages.sublist(0, _messages.length - 1), message];
    _messagesController.add(_messages);
    state = state.copyWith(messages: _messages);
  }

  Future<void> sendMessage(String message) async {
    final trimmed = message.trim();
    if (trimmed.isEmpty || state.requestState.isLoading) return;

    _addMessage(HomeChatMessage.text(text: trimmed, isUser: true));
    _addMessage(HomeChatMessage.loading());

    state = state.copyWith(
      userSituation: trimmed,
      currentStep: ChatStep.waitingRecommend,
      requestState: const AsyncLoading<void>(),
    );

    try {
      final recommendResponse = await ref.read(getRecommendFlowerUseCaseProvider).call(
            situation: trimmed,
          );

      final flowers = recommendResponse.result.flowers
          .map((dto) => dto.toFlowerInfoModel())
          .toList();

      final requestId = recommendResponse.result.requestId;

      "flower $flowers".logD();
      if (flowers.isEmpty) {
        throw FlowerException(message: '추천 결과가 없습니다.');
      }

      // 로딩 메시지 제거
      _messages = _messages.sublist(0, _messages.length - 1);
      _messagesController.add(_messages);

      state = state.copyWith(
        requestId: requestId,
        recommendedFlowers: flowers,
        currentStep: ChatStep.showRecommend,
        requestState: const AsyncData<void>(null),
        messages: _messages,
      );

      _addMessage(HomeChatMessage.text(
        text: AppMessages.recommendSubtitle,
        isUser: false,
      ));
      _addMessage(HomeChatMessage.flowerCards(flowers: flowers));
      _addMessage(HomeChatMessage.actionButtons());
    } catch (error) {
      "home chat error: ${error.toString()}".logE();
      
      // 로딩 메시지 제거
      if (_messages.isNotEmpty) {
        _messages = _messages.sublist(0, _messages.length - 1);
        _messagesController.add(_messages);
      }

      state = state.copyWith(
        currentStep: ChatStep.initial,
        messages: _messages,
        requestState: AsyncError<void>(
          error is FlowerException ? error : FlowerException(message: error.toString()),
          StackTrace.current,
        ),
      );
    }
  }

  void onReset() {
    _messages = [];
    _messagesController.add(_messages);
    state = HomeState.init();
  }

  void onFindShop() {
    // Map 페이지로 이동 로직은 UI에서 처리
  }

  void onStartLetter() {
    // 로딩 메시지 제거
    if (_messages.isNotEmpty) {
      _messages = _messages.sublist(0, _messages.length - 1);
      _messagesController.add(_messages);
    }

    state = state.copyWith(currentStep: ChatStep.selectFlower);
    
    _addMessage(HomeChatMessage.text(
      text: '어떤 꽃이 마음에 드시나요?',
      isUser: false,
    ));
    _addMessage(HomeChatMessage.flowerSelection(flowers: state.recommendedFlowers));
  }

  void onSelectFlower(FlowerInfoModel flower) {
    // 선택한 꽃만 남기고 나머지 제거
    if (_messages.isNotEmpty) {
      _messages = _messages.sublist(0, _messages.length - 1);
      _messagesController.add(_messages);
    }

    state = state.copyWith(
      selectedFlower: flower,
      currentStep: ChatStep.selectRecipient,
    );

    _addMessage(HomeChatMessage.text(
      text: flower.name,
      isUser: true,
    ));

    _addMessage(HomeChatMessage.recipientSelection());
  }

  Future<void> onSelectRecipient(String recipient) async {
    final recipientType = _mapRecipientToType(recipient);
    final flower = state.selectedFlower;
    final situation = state.userSituation;

    if (flower == null || situation == null) return;

    // 선택한 수신자만 남기고 나머지 제거
    _addMessage(HomeChatMessage.text(
      text: '누구에게 전하는 꽃인가요?',
      isUser: false,
    ));
    _replaceLastMessage(HomeChatMessage.text(text: recipient, isUser: true));
    _addMessage(HomeChatMessage.loading());

    state = state.copyWith(
      selectedRecipient: recipient,
      currentStep: ChatStep.makingLetter,
      requestState: const AsyncLoading<void>(),
    );

    try {
      final letterResponse = await ref.read(makeLetterUseCaseProvider).call(
            requestId: state.requestId!,
            flowerId: flower.flowerId!,
            recipient: recipientType,
          );

      final letter = letterResponse.result.letter;

      // 로딩 메시지 제거
      _messages = _messages.sublist(0, _messages.length - 1);
      _messagesController.add(_messages);

      state = state.copyWith(
        letterContent: letter,
        currentStep: ChatStep.showLetter,
        requestState: const AsyncData<void>(null),
        messages: _messages,
      );

      _addMessage(HomeChatMessage.text(
        text: '편지가 완성됐어요!\n\n$letter',
        isUser: false,
      ));
    } catch (error) {
      "letter generation error: ${error.toString()}".logE();
      
      // 로딩 메시지 제거
      if (_messages.isNotEmpty) {
        _messages = _messages.sublist(0, _messages.length - 1);
        _messagesController.add(_messages);
      }

      state = state.copyWith(
        currentStep: ChatStep.selectRecipient,
        messages: _messages,
        requestState: AsyncError<void>(
          error is FlowerException ? error : FlowerException(message: error.toString()),
          StackTrace.current,
        ),
      );
    }
  }

  void consumeRequestState() {
    state = state.copyWith(requestState: const AsyncData<void>(null));
  }

  String _mapRecipientToType(String recipient) {
    switch (recipient) {
      case '어른/상사':
        return 'senior';
      case '친구':
        return 'friend';
      case '연인':
        return 'significant other';
      case '동료':
        return 'coworker';
      case '동년배':
        return 'peer';
      case '동생':
        return 'junior';
      case '기타':
        return 'other';
      default:
        return 'other';
    }
  }
}
