import 'dart:async';

import 'package:flutter/material.dart';

import 'menu/home_screen.dart';

class SplashScreenSantAnna extends StatefulWidget {
  static String id = 'splash';
  @override
  _SplashScreenSantAnnaState createState() => _SplashScreenSantAnnaState();
}

class _SplashScreenSantAnnaState extends State<SplashScreenSantAnna> {

  @override
  void initState() {
    Timer(
      const Duration(milliseconds: 3000), () {
        Navigator.pushNamed(context, HomeScreen.id);
    },
    );
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 300,
              height: 400,
              color: Colors.white,
              child: Image.asset('images/donna.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}