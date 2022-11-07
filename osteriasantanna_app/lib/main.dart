import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:osteriasantannamenu/reservation/reservation.dart';
import 'package:osteriasantannamenu/screens/menu/home_screen.dart';
import 'package:osteriasantannamenu/screens/splash_screen_santanna.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'databundle/databundleprovider.dart';

void main() {
  setPathUrlStrategy();
  runApp(DevicePreview(
    enabled: false,
    tools: const [
      ...DevicePreview.defaultTools,
    ],
    builder: (context) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataBundleNotifier(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Osteria Menu',
          initialRoute: SplashScreenSantAnna.id,
          routes:{
            SplashScreenSantAnna.id : (context) => SplashScreenSantAnna(),
            HomeScreen.id : (context) => HomeScreen(),
            ReservationScreen.id : (context) => ReservationScreen(),
          }
      ),
    );
  }
}