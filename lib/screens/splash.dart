import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pranermart/screens/home_screen.dart';
import 'package:pranermart/screens/welcome_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Get.offAll(()=>const WelcomeScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constaints) {
      return Scaffold(
        body: SafeArea(
            child: ListView(
          children: [
            Container(
              height: screenSize.height / 1,
              alignment: Alignment.center,
              child: Center(
                  child:
                      Lottie.asset("assets/animations/anim.json", height: 100)),
            )
          ],
        )),
      );
    });
  }
}
