import 'package:flutter/material.dart';
import 'package:pranermart/app/profile/widgets/account_section.dart';
import 'package:pranermart/app/profile/widgets/oder_history.dart';
import 'package:pranermart/app/profile/widgets/profile_background.dart';
import 'package:pranermart/app/profile/widgets/profile_header.dart';
import 'package:pranermart/app/profile/widgets/setting_section.dart';

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
