import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pranermart/utils/app_config.dart';
import 'drawer_utils.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Drawer(
      width: w / 1.5,
      child: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              children: [
                Image.asset(
                  AppConfig.appLogo,
                  width: 200,
                ),
                const SizedBox(height: 20.0),
                ListTile(
                  title: const Text(
                    "Home",
                    style: TextStyle(color: Colors.teal),
                  ),
                  leading: const Icon(Icons.home_outlined, color: Colors.teal),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                for (int i = 0; i < navItem.length; i++)
                  ListTile(
                    title: Text(navItem[i]["title"]),
                    leading: Icon(navItem[i]["icon"]),
                    onTap: () {
                      Get.to(navItem[i]["screen"]);
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
