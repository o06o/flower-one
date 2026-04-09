import 'package:flowerone/core/resource/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../google_client.dart';

class GoogleSignInWidget extends StatelessWidget {
  final Future<void> Function(
    String idToken,
    String accessToken,
    String? serverAuthCode,
  )
  onSuccess;
  final VoidCallback? onFailed;

  static final GoogleSignClient _googleSignClient = GoogleSignClient();

  const GoogleSignInWidget({super.key, required this.onSuccess, this.onFailed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white, // 텍스트 및 아이콘 색상 설정
          shape: const StadiumBorder(), // 양 끝이 둥근 모양
          elevation: 1, // 약간의 그림자 효과 추가
        ),
        onPressed: () async {
          final signInResult = await _googleSignClient.signIn();
          if (signInResult == null) {
            onFailed?.call();
            return;
          }

          await onSuccess(
            signInResult.idToken,
            signInResult.accessToken,
            signInResult.serverAuthCode,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.googleLogo.svg(width: 25, height: 25),
            const SizedBox(width: 12),
            const Text(
              'Sign in with Google',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
