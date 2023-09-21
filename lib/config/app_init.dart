import 'package:contoh_modularisasi/main.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../di/di.dart';

initApp({Flavor appFlavor = Flavor.dev}) async {
  AppConfig.appFlavor = appFlavor;
  WidgetsFlutterBinding.ensureInitialized();
  await _initLogger();
  await _openLocalStorage();
  // await Upgrader.clearSavedSettings();
  await configureInjection(AppConfig.envName);
  runApp(const MyApp());
}

Future<void> _initLogger() async {
  AppConfig.logger = Logger(
    filter: null,
    printer: PrettyPrinter(
      stackTraceBeginIndex: 1,
      methodCount: 2,
      printTime: true,
    ),
    output: null, //
  );
}

Future<void> _openLocalStorage() async {
  await Hive.initFlutter();
  // Hive.registerAdapter(HiveProfilEntityAdapter());
  try {
    await Hive.openBox(HiveBoxName.boxModularisasi);
  } catch (e) {
    AppConfig.logger.e(e);
  }
}
