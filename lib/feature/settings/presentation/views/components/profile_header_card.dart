import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/designsystem/components/coponents.dart';
import '../../../../../core/designsystem/theme/theme_data.dart';

class SettingsProfileHeaderCard extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String? profileImageUrl;

  const SettingsProfileHeaderCard({
    super.key,
    required this.userName,
    required this.userEmail,
    this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = profileImageUrl?.trim();
    final hasImage = imageUrl != null && imageUrl.isNotEmpty;

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
          clipBehavior: Clip.antiAlias,
          child: hasImage
              ? CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (_, _) => _fallback(context),
                  errorWidget: (_, _, _) => _fallback(context),
                )
              : _fallback(context),
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

  Widget _fallback(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: context.colorScheme.primary.withAlpha(22),
      child: Icon(Icons.person_rounded, color: context.colorScheme.primary),
    );
  }
}
