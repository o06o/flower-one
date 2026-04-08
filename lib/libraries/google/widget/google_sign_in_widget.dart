import 'package:flowerone/core/resource/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../google_client.dart';

class GoogleSignInWidget extends StatelessWidget {
  final GoogleSignClient googleSignClient;
  final void Function(GoogleSignInResult?) onResult;

  const GoogleSignInWidget({
    super.key,
    required this.onResult,
    required this.googleSignClient,
  });

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
          final signInResult = await googleSignClient.signIn();
          onResult(signInResult);
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
