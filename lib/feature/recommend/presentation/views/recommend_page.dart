import 'package:flutter/material.dart';

import '../../../home/presentation/viewmodels/home_viewmodel.dart';

class RecommendPage extends StatelessWidget {
  final List<FlowerRecommendation> flowers;

  const RecommendPage({
    super.key,
    required this.flowers,
  });

  @override
  Widget build(BuildContext context) {
    if (flowers.isEmpty) {
      return const Center(child: Text('추천 결과가 없어요.'));
    }

    return SafeArea(
      child: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          final flower = flowers[index];
          return Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).dividerColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  flower.name,
                  style: Theme.of(context).textTheme.titleLarge,
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
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemCount: flowers.length,
      ),
    );
  }
}
