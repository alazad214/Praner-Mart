import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pranermart/screens/navigation_screen.dart';
import 'package:pranermart/screens/welcome_screen.dart';
import 'package:pranermart/utils/colors.dart';

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
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/applogo.png",
                height: 100,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: LinearProgressIndicator(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
