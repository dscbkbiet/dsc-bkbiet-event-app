import 'package:dsc_event/common/constants/Strings.dart';
import 'package:dsc_event/data/core/PushNotificationService.dart';
import 'package:dsc_event/presentation/journeys/Splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'di/get_it.dart' as getIt;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
  await PushNotificationService.init();
  await getIt.init();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.app_name,
      home: SplashScreen(),
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme:
            const AppBarTheme(elevation: 0, backgroundColor: Color(0xFF212121)),
      ),
    ),
  );
}
