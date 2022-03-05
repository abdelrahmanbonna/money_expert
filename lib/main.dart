import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:money_expert/Configurations/configurations.dart';
import 'package:theme_manager/theme_manager.dart';
import 'Services/crashlytics_service.dart';
import 'Services/loading_service.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    await Firebase.initializeApp();
    CrashlyticsService.initCrashlytics();
    runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        saveLocale: false,
        startLocale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    );
    configLoading();
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
      ),
    );
    return ThemeManager(
      loadBrightnessOnStart: true,
      defaultBrightnessPreference: BrightnessPreference.system,
      themedWidgetBuilder: (
        BuildContext context,
        ThemeData theme,
      ) =>
          MaterialApp(
        theme: theme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: PageRouteName.initial,
        onGenerateRoute: Routes.generateRoute,
        builder: EasyLoading.init(
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
            ),
            child: child ?? const Scaffold(),
          ),
        ),
      ),
      data: (Brightness brightness) {
        switch (brightness) {
          case Brightness.light:
            return ThemeData(
              primaryColor: const Color.fromARGB(255, 116, 74, 195),
              backgroundColor: Colors.grey[300],
              primarySwatch: Constants.createMaterialColor(
                const Color.fromARGB(255, 116, 74, 195),
              ),
              scaffoldBackgroundColor: Colors.grey[300],
              shadowColor: const Color.fromARGB(255, 255, 255, 255),
              brightness: brightness,
            );
          case Brightness.dark:
            return ThemeData(
              primaryColor: const Color.fromARGB(255, 116, 74, 195),
              primarySwatch: Constants.createMaterialColor(
                const Color.fromARGB(255, 116, 74, 195),
              ),
              backgroundColor: const Color.fromARGB(255, 43, 43, 43),
              scaffoldBackgroundColor: Colors.grey[800],
              shadowColor: const Color.fromARGB(255, 43, 43, 43),
              brightness: brightness,
            );
          default:
            return ThemeData(
              primaryColor: const Color.fromARGB(255, 116, 74, 195),
              backgroundColor: Colors.grey[300],
              primarySwatch: Constants.createMaterialColor(
                const Color.fromARGB(255, 116, 74, 195),
              ),
              scaffoldBackgroundColor: Colors.grey[300],
              brightness: brightness,
            );
        }
      },
    );
  }
}
