import 'package:flutter/material.dart';
import '../widgets/account_section.dart';
import '../widgets/oder_history.dart';
import '../widgets/profile_background.dart';
import '../widgets/profile_header.dart';
import '../widgets/setting_section.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ProfileBackground(),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileHeader(),
                  SizedBox(height: 20),
                  AccountSection(),
                  SizedBox(height: 20),
                  OderHistory(),
                  SizedBox(height: 20),
                  SettingSection()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
