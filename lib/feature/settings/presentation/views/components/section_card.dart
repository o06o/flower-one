import 'package:flutter/material.dart';

import '../../../../../core/designsystem/theme/theme_data.dart';

class SettingsSectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSectionCard({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 10, 6),
            child: Text(
              title,
              style: context.textTheme.main2Regular.copyWith(
                color: context.colorScheme.text_2,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }
}
