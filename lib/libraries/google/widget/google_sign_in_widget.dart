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
  final double width;
  final double height;
  static final GoogleSignClient _googleSignClient = GoogleSignClient();

  const GoogleSignInWidget({
    super.key,
    required this.onSuccess,
    this.onFailed,
    this.width = 230,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
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
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.black, width: 1.0),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.googleLogo.svg(width: 20, height: 20),
            const SizedBox(width: 12),
            const Text(
              'Sign in with Google',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
