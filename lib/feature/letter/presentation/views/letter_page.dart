import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/designsystem/components/coponents.dart';
import '../../../../core/designsystem/dialog/dialog.dart';
import '../../../../core/utils/error/ui_error_handler.dart';
import '../event/letter_ui_event.dart';
import '../viewmodel/letter_view_model.dart';

class LetterPage extends HookConsumerWidget {
  const LetterPage({
    super.key, 
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(letterViewModelProvider.notifier);
    final state = ref.watch(letterViewModelProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.makeLetter();
      });
      return null;
    }, []);

    ref.listen(
      letterViewModelProvider.select((state) => state.result),
      (prev, next) {
        if (next != null) {
          next.when(
            success: (event) {
              event.when(
                showToast: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(message)),
                  );
                },
              );
            },
            error: (error) => UiErrorHandler.handle(context, error),
            loading: (showProgress) {
              showProgress
                  ? LottieProgressDialog.show(context: context)
                  : LottieProgressDialog.hide();
            },
          );
          viewModel.consumeResult();
        }
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
