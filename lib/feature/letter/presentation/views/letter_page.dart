import 'package:flutter/material.dart';

import '../../../../core/designsystem/components/coponents.dart';

class LetterPage extends StatelessWidget {
  final String userMessage;
  const LetterPage({super.key, required this.userMessage});

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(child: Center(child: Text("LetterPage: $userMessage")));
  }
}
