import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:osteriasantannamenu/reservation/reservation.dart';
import 'package:osteriasantannamenu/screens/manager_area/calendar/calendar_manager.dart';
import 'package:osteriasantannamenu/screens/menu/home_screen.dart';
import 'package:osteriasantannamenu/screens/splash_screen_santanna.dart';
import 'package:provider/provider.dart';
import 'databundle/databundleprovider.dart';

void main() {
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
          color: Color(0xff121212),
          debugShowCheckedModeBanner: false,
          title: 'Osteria Menu',
          initialRoute: SplashScreenSantAnna.id,
          routes:{
            SplashScreenSantAnna.id : (context) => SplashScreenSantAnna(),
            HomeScreen.id : (context) => HomeScreen(),
            ReservationScreen.id : (context) => ReservationScreen(),
            CalendarManager.id : (context) => CalendarManager(),
          }
      ),
    );
  }
}