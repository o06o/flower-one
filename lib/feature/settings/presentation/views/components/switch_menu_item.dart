import 'package:flutter/material.dart';

import '../../../../../core/designsystem/components/coponents.dart';
import '../../../../../core/designsystem/theme/theme_data.dart';

class SettingsSwitchMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingsSwitchMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: context.colorScheme.text_1),
          SpacingHorizontal12(),
          Expanded(
            child: Text(
              title,
              style: context.textTheme.main1Regular.copyWith(
                color: context.colorScheme.text_1,
              ),
            ),
          ),
          Transform.scale(
            scale: 0.82,
            child: Switch.adaptive(
              value: value,
              activeThumbColor: context.colorScheme.primary,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
