import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/designsystem/components/coponents.dart';
import '../../../../core/router/pages.dart';
import '../viewmodel/settings_view_model.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsViewModelProvider);
    final viewModel = ref.read(settingsViewModelProvider.notifier);

    ref.listen<SettingsState>(settingsViewModelProvider, (previous, next) {
      if (!(previous?.isSignedOut ?? false) && next.isSignedOut) {
        context.go(PAGES.intro.screenPath);
      }

      final previousError = previous?.errorMessage;
      if (next.errorMessage != null && next.errorMessage != previousError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });

    return DefaultContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          Text('설정', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: state.isLoading ? null : () => viewModel.signOut(),
            child: Text(state.isLoading ? '로그아웃 중...' : '로그아웃'),
          ),
        ],
      ),
    );
  }
}
