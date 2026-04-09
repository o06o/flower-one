import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/designsystem/theme/app_theme.dart';
import 'core/resource/gen/colors.gen.dart';
import 'core/router/app_router.dart';
import 'core/storage/pref/pref_storage.dart';

bool _shouldIgnoreFlutterError(FlutterErrorDetails details) {
  final text = details.exceptionAsString();

  // 대표적으로 "죽지 않는" UI/레이아웃류 noisy 에러들 필터링
  if (text.contains('A RenderFlex overflowed by')) return true;
  if (text.contains('RenderBox was not laid out')) return true;
  if (text.contains('BoxConstraints forces an infinite')) return true;
  if (text.contains('Viewport') && text.contains('was given unbounded')) {
    return true;
  }

  // 필요하면 계속 추가
  return false;
}

/// 예상 가능한 에러(네트워크 에러, API 에러 등)는 Crashlytics에 보내지 않음
bool _shouldIgnoreError(Object error) {
  // if (error is DdukException) return true;
  return false;
}

const String _supabaseUrlFromEnv = String.fromEnvironment('SUPABASE_URL');
const String _supabaseAnonKeyFromEnv = String.fromEnvironment(
  'SUPABASE_ANON_KEY',
);

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await initializePackages();

  // Flutter 프레임워크에서 발생한 모든 에러를 Crashlytics에 기록
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details); // 기존처럼 콘솔 출력

    if (kReleaseMode) {
      if (!_shouldIgnoreFlutterError(details)) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(details);
      }
    }
  };
  // Flutter 프레임워크 외부에서 발생한 에러(PlatformDispatcher)를 Crashlytics에 기록
  PlatformDispatcher.instance.onError = (error, stack) {
    if (kReleaseMode && !_shouldIgnoreError(error)) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    }
    return true;
  };
  final preferences = await SharedPreferences.getInstance();

  final container = ProviderContainer(
    overrides: [
      preferenceStorageProvider.overrideWithValue(
        PreferenceStorage(preferences),
      ),
    ],
  );

  runZonedGuarded<Future<void>>(
    () async {
      initializeDateFormatting().then(
        (_) => runApp(
          UncontrolledProviderScope(
            container: container,
            child: const MainApp(),
          ),
        ),
      );
    },
    (error, stack) {
      if (kReleaseMode && !_shouldIgnoreError(error)) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      }
    },
  );
}

Future<void> initializePackages() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // 필요하면 portraitDown도 추가
    // DeviceOrientation.portraitDown,
  ]);

  final supabaseUrl = _requireEnv(
    name: 'SUPABASE_URL',
    value: _supabaseUrlFromEnv,
  );
  final supabaseAnonKey = _requireEnv(
    name: 'SUPABASE_ANON_KEY',
    value: _supabaseAnonKeyFromEnv,
  );

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);

  // final firebaseOptions = switch (appFlavor) {
  //   'prod' => prod.DefaultFirebaseOptions.currentPlatform,
  //   'dev' => dev.DefaultFirebaseOptions.currentPlatform,
  //   _ => throw UnsupportedError('Invalid flavor: $appFlavor'),
  // };
  //
  // await Firebase.initializeApp(options: firebaseOptions);
}

String _requireEnv({required String name, required String value}) {
  if (value.isNotEmpty) return value;

  throw StateError(
    '$name is missing. Run with --dart-define or --dart-define-from-file.',
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      child: Builder(
        builder: (context) {
          final brightness = MediaQuery.of(context).platformBrightness;
          final isDarkMode = brightness == Brightness.dark;

          return FlowerTheme(
            themeData: isDarkMode
                ? FlowerThemeData.dark()
                : FlowerThemeData.light(),
            child: MaterialApp.router(
              builder: FToastBuilder(),
              routerConfig: router,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(useMaterial3: true).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                textSelectionTheme: TextSelectionThemeData(
                  cursorColor: ColorName.primary,
                  selectionHandleColor: ColorName.primary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
