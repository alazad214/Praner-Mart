import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pranermart/screens/navigation_screen.dart';
import 'package:pranermart/screens/welcome_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      if (user == null) {
        Get.off(const WelcomeScreen());
      } else {
        Get.offAll(NavigationScreen());
      }
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
                child: Image.asset(
                  "assets/images/applogo.png",
                  height: 200,
                ),
              ),
            )
          ],
        )),
      );
    });
  }
}
