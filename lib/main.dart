import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'config/app_config.dart';
import 'core/router/app_router.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await initializePackages();

  runApp(const MainApp());
}

Future<void> initializePackages() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // 필요하면 portraitDown도 추가
    // DeviceOrientation.portraitDown,
  ]);

  // final firebaseOptions = switch (appFlavor) {
  //   'prod' => prod.DefaultFirebaseOptions.currentPlatform,
  //   'dev' => dev.DefaultFirebaseOptions.currentPlatform,
  //   _ => throw UnsupportedError('Invalid flavor: $appFlavor'),
  // };
  //
  // await Firebase.initializeApp(options: firebaseOptions);
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

          return MaterialApp.router(
            builder: FToastBuilder(),
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                useMaterial3: true
            ).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              // textSelectionTheme: TextSelectionThemeData(
              //   cursorColor: ColorName.primaryLightGreen,
              //   selectionHandleColor: ColorName.primaryLightGreen,
              // ),
            ),
          );
        },
      ),
    );
  }
}