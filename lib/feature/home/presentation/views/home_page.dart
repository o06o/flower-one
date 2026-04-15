import 'dart:async';

import 'package:flowerone/core/designsystem/components/coponents.dart';
import 'package:flowerone/core/designsystem/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_messages.dart';
import '../../../../core/designsystem/dialog/progress_dialog.dart';
import '../../../../core/router/pages.dart';
import '../viewmodel/home_viewmodel.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _messageController = TextEditingController();
  ProviderSubscription<HomeState>? _homeStateSubscription;

  @override
  void initState() {
    super.initState();
    _homeStateSubscription = ref.listenManual<HomeState>(homeViewModelProvider, (
      previous,
      next,
    ) {
      if (!mounted) return;
      if (next.isSending) {
        LottieProgressDialog.show(context: context);
      } else {
        LottieProgressDialog.hide();
      }

      final hasNewResult =
          (previous?.resultFlowers.isEmpty ?? true) && next.resultFlowers.isNotEmpty;
      if (hasNewResult) {
        context.pushNamed(
          PAGES.recommend.screenName,
          extra: next.resultFlowers,
        );
      }
    });
    Timer(const Duration(seconds: 1), () {
      if (!mounted) return;
      FlutterNativeSplash.remove();
    });
  }

  @override
  void dispose() {
    _homeStateSubscription?.close();
    LottieProgressDialog.hide();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    FocusScope.of(context).unfocus();
    await ref.read(homeViewModelProvider.notifier).messageTest(
      _messageController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: context.colorScheme.primary,
      ),
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (state.errorMessage != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      state.errorMessage!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _messageController,
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
            onPressed: state.isSending ? null : _sendMessage,
            child: const Text(AppMessages.homeRecommendButton),
          ),
        ],
      ),
    );
  }
}
