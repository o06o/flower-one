import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/designsystem/components/coponents.dart';
import '../../../../core/designsystem/dialog/dialog.dart';
import '../../../../core/model/exception/flower_exception.dart';
import '../../../../core/utils/error/ui_error_handler.dart';
import '../viewmodel/letter_view_model.dart';

class LetterPage extends HookConsumerWidget {
  final String userMessage;
  final String flowerName;

  const LetterPage({
    super.key,
    required this.userMessage,
    required this.flowerName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(letterViewModelProvider.notifier);
    final state = ref.watch(letterViewModelProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.makeLetter(
          message: userMessage,
          flowerName: flowerName,
        );
      });
      return null;
    }, [userMessage, flowerName]);

    ref.listen(
      letterViewModelProvider.select((state) => state.requestState),
      (prev, next) {
        if (next.isLoading) {
          LottieProgressDialog.show(context: context);
          return;
        }

        LottieProgressDialog.hide();

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

    return DefaultContainer(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '생성된 편지:',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                state.letterContent.isEmpty
                    ? '편지를 생성 중입니다...'
                    : state.letterContent,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
