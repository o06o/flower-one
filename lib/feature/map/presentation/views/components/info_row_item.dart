import 'package:flutter/material.dart';

import '../../../../../core/designsystem/components/coponents.dart';
import '../../../../../core/designsystem/theme/app_theme.dart';

class InfoRowItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final int maxLines;

  const InfoRowItem({
    super.key,
    required this.icon,
    required this.text,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: context.colorScheme.ico),
        SpacingHorizontal8(),
        Expanded(
          child: Text(
            text,
            style: context.textTheme.main1RegularHakgyo,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
