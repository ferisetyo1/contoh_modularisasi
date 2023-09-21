import 'package:core/core.dart';

class AppConfig {
  static Flavor? appFlavor;
  static late final Logger logger;

  static const longTimeOutMilliSecond = Duration(milliseconds: 30000);

  static const baseUrlProd = 'https://api.jsonbin.io/v3/b';
  static const baseUrlDev = 'https://development.example.com';
  static var clientIdDev = "99e96766-fffe-4f59-bffc-352921544935";
  static var clientIdProd =
      "\$2a\$10\$Itx9TMSd5rMpQ4edCrAEQOqYnhimosRqdLWBIUFKWOgrMlFEmN9mu";

  static String get envName {
    switch (appFlavor) {
      case Flavor.prod:
        return 'prod';
      default:
        return 'dev';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.prod:
        return AppConfig.baseUrlProd;
      default:
        return AppConfig.baseUrlDev;
    }
  }

  static String get baseUrlApi {
    // return "$baseUrl/api/";
    return "$baseUrl/";
  }

  static String get clientId {
    switch (appFlavor) {
      case Flavor.prod:
        return AppConfig.clientIdProd;
      default:
        return AppConfig.clientIdDev;
    }
  }

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'E-Modulariasi Mobile';
      default:
        return 'E-Modulariasi Mobile Dev';
    }
  }
}
