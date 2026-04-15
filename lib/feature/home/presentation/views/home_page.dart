import 'dart:async';

import 'package:flowerone/core/designsystem/components/coponents.dart';
import 'package:flowerone/core/designsystem/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/constants/app_messages.dart';
import '../../../../core/router/pages.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageController = useTextEditingController();

    useEffect(() {
      Timer(const Duration(seconds: 1), () {
        FlutterNativeSplash.remove();
      });
      return null;
    }, []);

    void sendMessage() {
      final text = messageController.text.trim();
      if (text.isEmpty) return;

      FocusScope.of(context).unfocus();

      context.pushNamed(
        PAGES.recommend.screenName,
        extra: text,
      );
    }

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
          const Spacer(),
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
            onPressed: sendMessage,
            child: const Text(AppMessages.homeRecommendButton),
          ),
        ],
      ),
    );
  }
}
