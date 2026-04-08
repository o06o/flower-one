import 'package:flowerone/core/designsystem/theme/theme_data.dart';
import 'package:flutter/widgets.dart';

import '../../../libraries/theme/theme.dart';

class FlowerTheme extends ICoreTheme {
  const FlowerTheme({
    super.key,
    required FlowerThemeData themeData,
    required super.child,
  }) : super(themeData: themeData);

  static FlowerThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FlowerTheme>()?.themeData as FlowerThemeData;
  }
}
