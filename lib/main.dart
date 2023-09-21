import 'package:contoh_modularisasi/router/router.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var appRouters = getIt<AppRouters>();
    return MaterialApp.router(
      title: 'Flutter Demo',
      routeInformationParser: appRouters.defaultRouteParser(),
      routerDelegate: appRouters.delegate(),
      debugShowCheckedModeBanner: false,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: child ?? const SizedBox()),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        // S.delegate,
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      // supportedLocales: S.delegate.supportedLocales,
    );
  }
}
