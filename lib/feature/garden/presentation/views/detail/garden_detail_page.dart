import 'package:flowerone/core/designsystem/components/container/bottom_nav_with_container.dart';
import 'package:flowerone/core/designsystem/theme/app_theme.dart';
import 'package:flowerone/feature/garden/presentation/model/garden_detail_type.dart';
import 'package:flutter/material.dart';

class GardenDetailPage extends StatelessWidget {
  final GardenDetailType type;

  const GardenDetailPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return BottomNavWithContainer(
      color: context.colorScheme.neutral,
      child: Text(type.title),
    );
  }
}
