import '../../resource/gen/colors.gen.dart';
import '../../resource/gen/fonts.gen.dart';
import 'app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../libraries/theme/theme_data.dart';

class FlowerThemeData extends ICoreThemeData {
  const FlowerThemeData({
    required super.appBarTheme,
    required super.textTheme,
    required super.colorScheme,
    required super.navigationBarThemeData,
    required super.dialogTheme,
    required super.dividerTheme,
  });

  factory FlowerThemeData.light() {
    final colorScheme = FlowerColorScheme.light();
    return FlowerThemeData(
      appBarTheme: FlowerAppBarTheme.light(),
      textTheme: FlowerTextTheme(colorScheme: colorScheme),
      colorScheme: colorScheme,
      navigationBarThemeData: FlowerNavigationBarThemeData.light(),
      dialogTheme: FlowerDialogTheme.light(),
      dividerTheme: FlowerDividerTheme.light(),
    );
  }

  factory FlowerThemeData.dark() {
    final colorScheme = FlowerColorScheme.dark();
    return FlowerThemeData(
      appBarTheme: FlowerAppBarTheme.dark(),
      textTheme: FlowerTextTheme(colorScheme: colorScheme),
      colorScheme: colorScheme,
      navigationBarThemeData: FlowerNavigationBarThemeData.dark(),
      dialogTheme: FlowerDialogTheme.dark(),
      dividerTheme: FlowerDividerTheme.dark(),
    );
  }
}

class FlowerAppBarTheme extends ICoreAppBarTheme {
  const FlowerAppBarTheme({
    required super.systemOverlayStyle,
    required super.primaryColor,
    required super.backgroundColor,
    super.toolbarHeight = 44.0,
    super.titleSpacing = 0.0,
    super.centerTitle = true,
  });

  factory FlowerAppBarTheme.light() {
    final colorScheme = FlowerColorScheme.light();
    return FlowerAppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      primaryColor: colorScheme.background,
      backgroundColor: colorScheme.background,
    );
  }

  factory FlowerAppBarTheme.dark() {
    final colorScheme = FlowerColorScheme.dark();
    return FlowerAppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      primaryColor: colorScheme.primary,
      backgroundColor: colorScheme.background,
    );
  }
}

class FlowerTextTheme extends ICoreTextTheme {
  final FlowerColorScheme colorScheme;

  const FlowerTextTheme({required this.colorScheme});

  Color get textBlack => colorScheme.black;
  Color get textWhite => colorScheme.white;
  Color get text_1 => colorScheme.text_1;
  Color get textGrayScaleBlack => colorScheme.grayScaleBlack;
}

extension on FlowerTextTheme {
  TextStyle defaultTextStyleForSize(double size) => TextStyle(
    package: kToolFlowerThemePackageName,
    fontFamily: FontFamily.pretendard,
    fontSize: size,
    height: 1,
    letterSpacing: 0,
    color: textBlack,
  );

  TextStyle hakgyoTextStyleForSize(double size) => TextStyle(
    fontFamily: FontFamily.hakgyoansim,
    fontSize: size,
    height: 1,
    letterSpacing: 0,
    color: textBlack,
  );
}

extension FlowerTextThemeDefaultExtension on FlowerTextTheme {
  // w700
  TextStyle get default28Bold => defaultTextStyleForSize(28.0).toBold();

  TextStyle get default20Bold => defaultTextStyleForSize(20.0).toBold();

  TextStyle get default18Bold => defaultTextStyleForSize(18.0).toBold();

  TextStyle get default17Bold => defaultTextStyleForSize(17.0).toBold();

  TextStyle get default16Bold => defaultTextStyleForSize(16.0).toBold();

  TextStyle get default12Bold => defaultTextStyleForSize(12.0).toBold();

  TextStyle get default10Bold => defaultTextStyleForSize(10.0).toSemiBold();


  // w600
  TextStyle get default32SemiBold => defaultTextStyleForSize(32.0).toSemiBold();

  TextStyle get default28SemiBold => defaultTextStyleForSize(28.0).toSemiBold();

  TextStyle get default20SemiBold => defaultTextStyleForSize(20.0.sp).toSemiBold();

  TextStyle get default17SemiBold => defaultTextStyleForSize(17.0).toSemiBold();

  TextStyle get default16SemiBold => defaultTextStyleForSize(16.0).toSemiBold();

  TextStyle get default15SemiBold => defaultTextStyleForSize(15.0).toSemiBold();

  TextStyle get default14SemiBold => defaultTextStyleForSize(14.0).toSemiBold();

  TextStyle get default13SemiBold => defaultTextStyleForSize(13.0).toSemiBold();

  // w500



  TextStyle get default24Medium => defaultTextStyleForSize(24.0).toMedium();

  TextStyle get default20Medium => defaultTextStyleForSize(20.0).toMedium();

  TextStyle get default18Medium => defaultTextStyleForSize(18.0).toMedium();

  TextStyle get default17Medium => defaultTextStyleForSize(17.0).toMedium();

  TextStyle get default16Medium => defaultTextStyleForSize(16.0).toMedium();

  TextStyle get default15Medium => defaultTextStyleForSize(15.0).toMedium();

  TextStyle get default14Medium => defaultTextStyleForSize(14.0).toMedium();

  TextStyle get default13Medium => defaultTextStyleForSize(13.0).toMedium();

  TextStyle get default12Medium => defaultTextStyleForSize(12.0).toMedium();

  TextStyle get default10Medium => defaultTextStyleForSize(10.0).toMedium();

  TextStyle get default8Medium => defaultTextStyleForSize(8.0).toMedium();

  // w400
  TextStyle get hakgyo18Medium => hakgyoTextStyleForSize(20.0).toRegular();


  TextStyle get default22Regular => defaultTextStyleForSize(22.0).toRegular();

  TextStyle get default20Regular => defaultTextStyleForSize(20.0).toRegular();

  TextStyle get default18Regular => defaultTextStyleForSize(18.0).toRegular();

  TextStyle get default17Regular => defaultTextStyleForSize(17.0).toRegular();

  TextStyle get default16Regular => defaultTextStyleForSize(16.0).toRegular();

  TextStyle get default15Regular => defaultTextStyleForSize(15.0).toRegular();

  TextStyle get default14Regular => defaultTextStyleForSize(14.0).toRegular();

  TextStyle get default13Regular => defaultTextStyleForSize(13.0).toRegular();

  TextStyle get default12Regular => defaultTextStyleForSize(12.0).toRegular();

  TextStyle get default11Regular => defaultTextStyleForSize(11.0).toRegular();

  TextStyle get default10Regular => defaultTextStyleForSize(10.0).toRegular();

  TextStyle get default8Regular => defaultTextStyleForSize(8.0).toRegular();

  // w300
  TextStyle get default18Light => defaultTextStyleForSize(18.0).toLight();

  TextStyle get default15Light => defaultTextStyleForSize(15.0).toLight();

  TextStyle get default14Light => defaultTextStyleForSize(14.0).toLight();

  TextStyle get default13Light => defaultTextStyleForSize(13.0).toLight();

  TextStyle get default12Light => defaultTextStyleForSize(12.0).toLight();

  TextStyle get default11Light => defaultTextStyleForSize(11.0).toLight();
}

extension FlowerTextThemeAlias on FlowerTextTheme {
  TextStyle get headline1Medium => default20Medium;
  TextStyle get headline1MediumMulti => headline1Medium.copyWith(height: 1.6);
  TextStyle get headline1Regular => default20Regular;
  TextStyle get headline1RegularMulti => headline1Regular.copyWith(height: 1.6);

  TextStyle get headline2Medium => default18Medium;
  TextStyle get headline2MediumWhite => default18Medium.copyWith(color: textWhite);
  TextStyle get headline2MediumMulti => headline2Medium.copyWith(height: 1.6);
  TextStyle get headline2MediumMultiWhite => headline2Medium.copyWith(height: 1.6, color: textWhite);
  TextStyle get headline2Regular => default18Regular;
  TextStyle get headline2RegularBlack => default18Regular.copyWith(color: textBlack);
  TextStyle get headline2RegularWhite => default18Regular.copyWith(color: textWhite);
  TextStyle get headline2RegularMulti => headline2Regular.copyWith(height: 1.6);

  TextStyle get headline2RegularHakgyoMulti => hakgyo18Medium.copyWith(height: 1.6);

  TextStyle get headline3Medium => default24Medium;
  TextStyle get headline3GrayBlack => default24Medium.copyWith(color: textBlack);

  TextStyle get main1Medium => default16Medium;
  TextStyle get main1MediumMulti => main1Medium.copyWith(height: 1.6);
  TextStyle get main1Regular => default16Regular;
  TextStyle get main1RegularGrayBlack => default16Regular.copyWith(color: textBlack);
  TextStyle get main1RegularMulti => main1Regular.copyWith(height: 1.6);

  TextStyle get main2Medium => default14Medium;
  TextStyle get main2MediumBlack => default14Medium.copyWith(color: textBlack);
  TextStyle get main2MediumBlackOpacity20 => default14Medium.copyWith(color: textGrayScaleBlack.withAlpha(40));
  TextStyle get main2MediumWhite => default14Medium.copyWith(color: textWhite);
  TextStyle get main2MediumMulti => main2Medium.copyWith(height: 1.6);
  TextStyle get main2Regular => default14Regular;
  TextStyle get main2RegularGrayBlack => main2Regular.copyWith(color: textBlack);
  TextStyle get main2RegularText => main2Regular.copyWith(color: text_1);
  TextStyle get main2RegularMulti => main2Regular.copyWith(height: 1.6);

  TextStyle get subText1Medium => default14Medium;

  TextStyle get subText2Regular => default12Regular;
  TextStyle get subText2Medium => default12Medium;
  TextStyle get subText2RegularGrayBlack => subText2Regular.copyWith(color: textBlack);
  TextStyle get subText2RegularMultiGrayBlack => subText2Regular.copyWith(height: 1.6, color: textBlack);

  TextStyle get subText3Regular => default8Medium;

  TextStyle get footnote => default12Regular;
  TextStyle get footnoteMulti => default12Regular.copyWith(height: 1.6);

  TextStyle get tabBar => default10Medium;
  TextStyle get tabBarMulti => default10Medium.copyWith(height: 1.6);

  TextStyle get labelNum => default8Medium;
  TextStyle get labelNumWhite => default8Medium.copyWith(color: textWhite);
}

extension on TextStyle {
  TextStyle toBold() => copyWith(fontWeight: FontWeight.w700);

  TextStyle toSemiBold() => copyWith(fontWeight: FontWeight.w600);

  TextStyle toMedium() => copyWith(fontWeight: FontWeight.w500);

  TextStyle toRegular() => copyWith(fontWeight: FontWeight.w400);

  TextStyle toLight() => copyWith(fontWeight: FontWeight.w300);
}

class FlowerColorScheme extends ICoreColorScheme {
  FlowerColorScheme({
    required super.brightness,
  });

  factory FlowerColorScheme.light() {
    return FlowerColorScheme(
      brightness: Brightness.light,
    );
  }

  factory FlowerColorScheme.dark() {
    return FlowerColorScheme(
      brightness: Brightness.dark,
    );
  }

  bool get isDarkMode => brightness == Brightness.dark;

  // 기본 배경/텍스트 색상
  Color get background => isDarkMode ? ColorName.black : ColorName.white;
  Color get background_2 => isDarkMode ? ColorName.grayscaleGray600 : ColorName.grayscaleGray100;
  Color get background_3 => isDarkMode ? ColorName.grayscaleGray600 : ColorName.grayscaleGray200;

  Color get surface => isDarkMode ? ColorName.black : ColorName.white;
  Color get onBackground => isDarkMode ? ColorName.white : ColorName.black;
  Color get onSurface => isDarkMode ? ColorName.white : ColorName.black;

  Color get text_1 => isDarkMode ? ColorName.grayscaleGray200 : ColorName.black;
  Color get text_2 => isDarkMode ? ColorName.grayscaleGray400 : ColorName.grayscaleGray500;
  Color get text_3 => isDarkMode ? ColorName.grayscaleGray400 : ColorName.grayscaleGray400;

  Color get indicator => isDarkMode ? ColorName.grayscaleGray300 : ColorName.grayscaleGray200;
  Color get ico => isDarkMode ? ColorName.grayscaleGray200 : ColorName.grayscaleBlack;
  Color get line => isDarkMode ? ColorName.grayscaleGray500 : ColorName.grayscaleGray100;
  Color get btn_1 => isDarkMode ? ColorName.grayscaleGray500 : ColorName.grayscaleGray400;
  Color get btn_2 => isDarkMode ? ColorName.grayscaleGray500 : ColorName.grayscaleGray100;
  Color get checkbox => isDarkMode ? ColorName.grayscaleGray500 : ColorName.grayscaleGray300;
  Color get secondary => ColorName.secondary;

  // 레거시 호환용 (기존 코드와의 호환성)
  Color get white => isDarkMode ? ColorName.black : ColorName.white;
  Color get black => isDarkMode ? ColorName.white : ColorName.black;

  Color get grayScaleBlack => isDarkMode ? ColorName.white : ColorName.grayscaleBlack;

  Color get read => ColorName.red;
  // 브랜드 색상 (다크모드에서도 유지)
  Color get primary => ColorName.primary;

  Color get grayscaleWhite => ColorName.grayscaleWhite;

  Color get gray200 => ColorName.grayscaleGray200;
  Color get gray900 => ColorName.grayscaleGray900;
}

class FlowerNavigationBarThemeData extends ICoreNavigationBarThemeData {
  const FlowerNavigationBarThemeData({
    required super.backgroundColor,
    super.height = 58.0,
  });

  factory FlowerNavigationBarThemeData.light() {
    final colorScheme = FlowerColorScheme.light();
    return FlowerNavigationBarThemeData(
      backgroundColor: colorScheme.background,
    );
  }

  factory FlowerNavigationBarThemeData.dark() {
    final colorScheme = FlowerColorScheme.dark();
    return FlowerNavigationBarThemeData(
      backgroundColor: colorScheme.background,
    );
  }
}

class FlowerDialogTheme extends ICoreDialogTheme {
  const FlowerDialogTheme({
    required super.titleTextStyle,
    required super.backgroundColor,
    required super.confirmTextStyle,
    required super.confirmBackgroundColor,
    required super.cancelTextStyle,
    required super.cancelBackgroundColor,
  });

  factory FlowerDialogTheme.light() {
    final colorScheme = FlowerColorScheme.light();
    final textTheme = FlowerTextTheme(colorScheme: colorScheme);
    return FlowerDialogTheme(
      titleTextStyle: textTheme.default15Medium.copyWith(
        color: colorScheme.grayScaleBlack,
      ),
      backgroundColor: colorScheme.white,
      confirmTextStyle: textTheme.default15SemiBold.copyWith(
        color: colorScheme.white,
      ),
      confirmBackgroundColor: colorScheme.primary,
      cancelTextStyle: textTheme.default15Medium.copyWith(
        color: colorScheme.black,
      ),
      cancelBackgroundColor: colorScheme.grayscaleWhite,
    );
  }

  factory FlowerDialogTheme.dark() {
    final colorScheme = FlowerColorScheme.dark();
    final textTheme = FlowerTextTheme(colorScheme: colorScheme);
    return FlowerDialogTheme(
      titleTextStyle: textTheme.default15Medium.copyWith(
        color: colorScheme.white,
      ),
      backgroundColor: colorScheme.black,
      confirmTextStyle: textTheme.default16SemiBold.copyWith(
        color: colorScheme.white,
      ),
      confirmBackgroundColor: colorScheme.primary,
      cancelTextStyle: textTheme.default15Medium.copyWith(
        color: colorScheme.black,
      ),
      cancelBackgroundColor: colorScheme.grayscaleWhite,
    );
  }
}

class FlowerDividerTheme extends ICoreDividerTheme {
  const FlowerDividerTheme({
    required super.color,
  });

  factory FlowerDividerTheme.light() {
    final colorScheme = FlowerColorScheme.light();
    return FlowerDividerTheme(
      color: colorScheme.gray200,
    );
  }

  factory FlowerDividerTheme.dark() {
    final colorScheme = FlowerColorScheme.dark();
    return FlowerDividerTheme(
      color: colorScheme.gray900,
    );
  }
}

extension FlowerThemeDataExtension on BuildContext {
  FlowerThemeData get themeData {
    return FlowerTheme.of(this);
  }

  FlowerAppBarTheme get appBarTheme {
    return themeData.appBarTheme as FlowerAppBarTheme;
  }

  FlowerTextTheme get textTheme {
    return themeData.textTheme as FlowerTextTheme;
  }

  FlowerColorScheme get colorScheme {
    return themeData.colorScheme as FlowerColorScheme;
  }

  FlowerNavigationBarThemeData get navigationBarThemeData {
    return themeData.navigationBarThemeData as FlowerNavigationBarThemeData;
  }

  FlowerDialogTheme get dialogTheme {
    return themeData.dialogTheme as FlowerDialogTheme;
  }

  FlowerDividerTheme get dividerTheme {
    return themeData.dividerTheme as FlowerDividerTheme;
  }
}
