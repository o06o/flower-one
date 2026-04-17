import 'dart:async';

import 'package:flowerone/core/designsystem/components/coponents.dart';
import 'package:flowerone/core/designsystem/dialog/dialog.dart';
import 'package:flowerone/core/designsystem/theme/app_theme.dart';
import 'package:flowerone/core/model/exception/flower_exception.dart';
import 'package:flowerone/core/model/model/flower_info_model.dart';
import 'package:flowerone/core/utils/error/ui_error_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_messages.dart';
import '../../../recommend/presentation/views/components/recommend_flower_card.dart';
import '../viewmodel/home_viewmodel.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageController = useTextEditingController();
    final viewModel = ref.read(homeViewModelProvider.notifier);
    final state = ref.watch(homeViewModelProvider);
    final scrollController = useScrollController();
    final messagesStream = useState<Stream<List<HomeChatMessage>>?>(null);

    useEffect(() {
      Timer(const Duration(seconds: 1), () {
        FlutterNativeSplash.remove();
      });
      messagesStream.value = viewModel.messagesStream;
      return null;
    }, []);

    useEffect(() {
      final stream = messagesStream.value;
      if (stream == null) return null;

      final subscription = stream.listen((_) {
        // 새 메시지가 추가되면 스크롤을 맨 아래로
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (scrollController.hasClients) {
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        });
      });

      return subscription.cancel;
    }, [messagesStream.value]);

    void sendMessage() {
      final text = messageController.text.trim();
      if (text.isEmpty) return;

      viewModel.sendMessage(text);
      messageController.clear();
      FocusScope.of(context).unfocus();
    }

    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: context.colorScheme.primary,
      ),
    );

    ref.listen(
      homeViewModelProvider.select((state) => state.requestState),
      (prev, next) {
        next.whenOrNull(
          error: (error, _) {
            final handledError = error is FlowerException
                ? error
                : FlowerException(message: error.toString());
            UiErrorHandler.handle(context, handledError);
            viewModel.consumeRequestState();
          },
        );
      },
    );

    return BottomNavWithContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SpacingVertical48(),
          Text(AppMessages.homeTitle1, style: context.textTheme.headline1RegularHakgyo,),
          SpacingVertical8(),
          Text(AppMessages.homeTitle2, style: context.textTheme.headline1RegularHakgyo.copyWith(color: context.colorScheme.primary),),
          SpacingVertical28(),
          Expanded(
            child: state.messages.isEmpty
                ? const SizedBox.shrink()
                : ListView.builder(
                    controller: scrollController,
                    reverse: false,
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final message = state.messages[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: message.when(
                          text: (text, isUser) => _buildTextMessage(context, text, isUser),
                          flowerCards: (flowers) => _buildFlowerCards(context, flowers, viewModel),
                          actionButtons: () => _buildActionButtons(context, viewModel),
                          flowerSelection: (flowers) => _buildFlowerSelection(context, flowers, viewModel),
                          recipientSelection: () => _buildRecipientSelection(context, viewModel),
                          loading: () => _buildLoadingMessage(context),
                        ),
                      );
                    },
                  ),
          ),
          if (state.currentStep == ChatStep.initial) ...[
            const SizedBox(height: 12),
            TextFormField(
              controller: messageController,
              minLines: 3,
              maxLines: 6,
              textInputAction: TextInputAction.newline,
              decoration: InputDecoration(
                hintText: AppMessages.homePlaceholder,
                border: inputBorder,
                enabledBorder: inputBorder,
                focusedBorder: inputBorder,
                errorBorder: inputBorder,
                focusedErrorBorder: inputBorder,
              ),
            ),
            const SizedBox(height: 12),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: context.colorScheme.primary,
              ),
              onPressed: state.requestState.isLoading ? null : sendMessage,
              child: const Text(AppMessages.homeRecommendButton),
            ),
          ] else
            const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildTextMessage(BuildContext context, String text, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: isUser
              ? context.colorScheme.primary
              : context.colorScheme.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text( text, style: context.textTheme.main1RegularHakgyo,),
      ),
    );
  }

  Widget _buildFlowerCards(BuildContext context, List<FlowerInfoModel> flowers, HomeViewModel viewModel) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: flowers.length,
        itemBuilder: (context, index) {
          final flower = flowers[index];
          return Container(
            width: 180,
            margin: const EdgeInsets.only(right: 12),
            child: RecommendFlowerCard(
              flower: flower,
              isFavorite: false,
              onTap: () {},
              onFavoriteTap: () {},
            ),
          );
        },
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, HomeViewModel viewModel) {
    return Row(
      children: [
        SizedBox(
          child: WhiteFilledButton(
            onTap: () => viewModel.onFindShop(),
            child: Text(
              AppMessages.recommendFindShopButton,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.main2RegularHakgyo,
            ),
          ),
        ),
        SpacingHorizontal8(),
        SizedBox(
          child: WhiteFilledButton(
            onTap: () => viewModel.onStartLetter(),
            child: Text(
              AppMessages.recommendMakeLetterShopButton,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.main2RegularHakgyo,
            ),
          ),
        ),
        SpacingHorizontal8(),
        SizedBox(
          child: WhiteFilledButton(
            onTap: () => viewModel.onReset(),
            child: Text(
              AppMessages.recommendResetButton,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.main2RegularHakgyo,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFlowerSelection(BuildContext context, List<FlowerInfoModel> flowers, HomeViewModel viewModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: flowers.map((flower) {
        return SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: WhiteFilledButton(
              onTap: () => viewModel.onSelectFlower(flower),
              child: Text(flower.name, style: context.textTheme.main2RegularHakgyo),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildRecipientSelection(BuildContext context, HomeViewModel viewModel) {
    final recipients = ['어른/상사', '친구', '연인', '동료', '동년배', '동생', '기타'];
    return Container(
      alignment: Alignment.centerLeft,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.75,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color:  context.colorScheme.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("누구에게 전하는 꽃인가요?", style: context.textTheme.main1RegularHakgyo,),
          SpacingVertical12(),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: context.colorScheme.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: context.colorScheme.line),
            ),
            padding: EdgeInsets.all(8),
            child: Wrap(
              spacing: 8,
              runSpacing: 12,
              children: recipients.map((recipient) {
                return RawChip(
                  onPressed: () {
                    viewModel.onSelectRecipient(recipient);
                  },
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  backgroundColor: context.colorScheme.white,
                  label: Text(recipient, style: context.textTheme.subText2RegularHakgyo,),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  side: BorderSide(color: context.colorScheme.line),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingMessage(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.colorScheme.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const SizedBox(
          width: 50,
          height: 50,
          child: LottieProgressWidget(),
        ),
      ),
    );
  }
}
