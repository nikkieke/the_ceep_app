import 'dart:async';

import 'package:flutter/material.dart';

import 'onboarding_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(
          builder: (context){
            return const OnboardingScreen();
          }));
    });

    super.initState();
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0x0ff4f4f4),
      backgroundColor: Colors.white70,
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset("assets/images/ceep.png", width: 170,)),
    );
  }
}


