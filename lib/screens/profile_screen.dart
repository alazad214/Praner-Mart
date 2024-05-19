import 'package:flutter/material.dart';
import 'package:pranermart/widgets/profile_listTile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 90,
                      width: 90,
                      alignment: Alignment.bottomRight,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(color: Colors.blueAccent),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("assets/images/profile.jpg"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Al Azad",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  const Text(
                    "01763551316",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  const Text(
                    "alazad214@gmail.com",
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ProfileListtile(
                    icon: Icons.location_on_rounded,
                    title: "Baliadangi, Thakurgaon",
                  ),
                  ProfileListtile(
                    icon: Icons.policy,
                    title: "Privacy Policy",
                  ),
                  ProfileListtile(
                    icon: Icons.settings,
                    title: "Settings",
                  ),
                  ProfileListtile(
                    icon: Icons.logout,
                    title: "Log Out",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
