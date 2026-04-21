import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/designsystem/components/coponents.dart';
import '../../../../core/designsystem/dialog/dialog.dart';
import '../../../../core/designsystem/theme/theme_data.dart';
import '../../../../core/router/pages.dart';
import '../../../../core/utils/url/url_launcher_util.dart';
import 'components/menu_item.dart';
import 'components/profile_header_card.dart';
import 'components/section_card.dart';
import 'components/switch_menu_item.dart';
import '../viewmodel/settings_view_model.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  static const String _termsUrl = 'https://example.com/terms';
  static const String _privacyUrl = 'https://example.com/privacy';
  static const String _reviewUrl = 'https://example.com/review';
  static const String _inquiryEmail = 'support@flowerone.app';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsViewModelProvider);
    final viewModel = ref.read(settingsViewModelProvider.notifier);

    ref.listen<SettingsState>(settingsViewModelProvider, (previous, next) {
      if (!(previous?.isLoading ?? false) && next.isLoading) {
        LottieProgressDialog.show(context: context);
      } else if ((previous?.isLoading ?? false) && !next.isLoading) {
        LottieProgressDialog.hide();
      }

      if (!(previous?.isSignedOut ?? false) && next.isSignedOut) {
        LottieProgressDialog.hide();
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SpacingVertical24(),
            Text('설정', style: context.textTheme.headline1RegularHakgyo),
            SpacingVertical20(),
            SettingsProfileHeaderCard(
              userName: state.userName.isEmpty ? '이름 미설정' : state.userName,
              userEmail: state.userEmail.isEmpty ? '이메일 미설정' : state.userEmail,
            ),
            SpacingVertical24(),
            SettingsSectionCard(
              title: '서비스',
              children: [
                SettingsSwitchMenuItem(
                  icon: Icons.notifications_active_outlined,
                  title: '푸쉬 허용',
                  value: state.isPushNotificationEnabled,
                  onChanged: viewModel.togglePushNotification,
                ),
                SettingsMenuItem(
                  icon: Icons.description_outlined,
                  title: '이용약관',
                  onTap: () =>
                      UrlLauncherUtil.launchExternalUrl(context, _termsUrl),
                ),
                SettingsMenuItem(
                  icon: Icons.shield_outlined,
                  title: '개인정보 처리방침',
                  onTap: () =>
                      UrlLauncherUtil.launchExternalUrl(context, _privacyUrl),
                ),
                SettingsMenuItem(
                  icon: Icons.support_agent_rounded,
                  title: '1:1문의하기',
                  onTap: () =>
                      UrlLauncherUtil.launchEmail(context, _inquiryEmail),
                ),
                SettingsMenuItem(
                  icon: Icons.star_rate_rounded,
                  title: '리뷰쓰기',
                  onTap: () =>
                      UrlLauncherUtil.launchExternalUrl(context, _reviewUrl),
                ),
                SettingsMenuItem(
                  icon: Icons.info_outline_rounded,
                  title: '앱 버전',
                  value: state.appVersion.isEmpty ? '-' : state.appVersion,
                ),
              ],
            ),
            SpacingVertical16(),
            SettingsSectionCard(
              title: '계정',
              children: [
                SettingsMenuItem(
                  icon: Icons.logout_rounded,
                  title: '로그아웃',
                  onTap: state.isLoading ? null : viewModel.signOut,
                ),
                SettingsMenuItem(
                  icon: Icons.person_remove_alt_1_rounded,
                  title: '회원탈퇴',
                  onTap: state.isLoading ? null : viewModel.withdrawMembership,
                  isDanger: true,
                ),
              ],
            ),
            SpacingVertical24(),
          ],
        ),
      ),
    );
  }
}
