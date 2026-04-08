import 'package:flutter/services.dart';

enum Flavor { dev, prod }

class AppConfig {
  static late final Flavor flavor;

  static bool get isDev => flavor == Flavor.dev;

  static String get baseUrl {
    switch (flavor) {
      case Flavor.dev:
        return 'https://ddukddak.mob96.net/ddk';
      case Flavor.prod:
        return 'https://ddukddak.beetry.net/ddk';
    }
  }

  static Future<void> init() async {
    final flavorName = await const MethodChannel('flavor').invokeMethod<String>('');
    flavor = Flavor.values.firstWhere(
      (e) => e.name == flavorName,
      orElse: () => Flavor.prod,
    );
  }
}