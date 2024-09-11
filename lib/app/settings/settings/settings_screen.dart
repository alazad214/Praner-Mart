import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pranermart/controllers/auth_controller.dart';
import 'package:pranermart/utils/app_config.dart';
import 'package:pranermart/widgets/app_button.dart';

class SettingsScreen extends StatelessWidget {
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppConfig.appLogo),
              Text(
                'Click the button below and logout.',
              ),
              SizedBox(height: 20),
              AppButton(
                text: 'LOGOUT',
                onTap: () {
                  logoutDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void logoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 20,
          child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.redAccent, Colors.amber],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Confirm Logout',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Are you sure you want to logout? You will need to log in again to access your account.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(width: 10),
                    AppButton(
                        text: 'Logout',
                        loadingText: 'Logout',
                        isLoading: controller.isLoading.value,
                        onTap: () {
                          controller.signOut();
                          Navigator.of(context).pop();
                        }),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
