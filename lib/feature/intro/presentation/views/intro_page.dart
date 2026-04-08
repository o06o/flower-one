import 'package:flutter/material.dart';

import '../../../../core/designsystem/dialog/progress_dialog.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: (){
          LottieProgressDialog.show(context: context);
        },
        child: Center(child: Text("intro")),
      ),
    );
  }
}
