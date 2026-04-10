import 'dart:async';

import 'package:flowerone/core/designsystem/components/container/default_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/designsystem/dialog/progress_dialog.dart';
import '../viewmodels/home_viewmodel.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      if (!mounted) return;
      FlutterNativeSplash.remove();
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    await ref.read(homeViewModelProvider.notifier).messageTest(
      _messageController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeViewModelProvider);

    if (state.isLoadingTags) {
      return const Center(child: LottieProgressWidget());
    }

    return DefaultContainer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (state.tags.isEmpty)
                        const Text('등록된 태그가 없어요.')
                      else
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(
                            state.tags.length,
                            (index) => Chip(label: Text(state.tags[index])),
                          ),
                        ),
                      const SizedBox(height: 16),
                      if (state.resultFlowers.isNotEmpty) ...[
                        const Text('결과'),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(
                            state.resultFlowers.length,
                            (index) {
                              final flower = state.resultFlowers[index];
                              return Container(
                                constraints: const BoxConstraints(minWidth: 160, maxWidth: 260),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).dividerColor,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      flower.name,
                                      style: Theme.of(context).textTheme.titleMedium,
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      flower.reason,
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
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
                decoration: const InputDecoration(
                  hintText: '상황을 입력해 주세요.',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: state.isSending ? null : _sendMessage,
                child: Text(state.isSending ? '전송 중...' : '전송'),
              ),
              TextButton(
                onPressed: () => ref.read(homeViewModelProvider.notifier).loadTags(),
                child: const Text('태그 새로고침'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
