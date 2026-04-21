import 'package:flutter/material.dart';

import '../../../../../core/designsystem/components/coponents.dart';
import '../../../../../core/designsystem/theme/theme_data.dart';

class SettingsProfileHeaderCard extends StatelessWidget {
  final String userName;
  final String userEmail;

  const SettingsProfileHeaderCard({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.primary.withAlpha(22),
          ),
          alignment: Alignment.center,
          child: Icon(Icons.person_rounded, color: context.colorScheme.primary),
        ),
        SpacingVertical12(),
        Text(userName, style: context.textTheme.main1Regular),
        SpacingVertical8(),
        Text(
          userEmail,
          style: context.textTheme.subText2Regular.copyWith(
            color: context.colorScheme.text_2,
          ),
        ),
      ],
    );
  }
}
