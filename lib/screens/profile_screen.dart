import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pranermart/service/firestore_service.dart';
import 'package:pranermart/widgets/profile_listTile.dart';
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final controller = Get.put(FireStoreService());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getuserProfile(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
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
                                    image:
                                        AssetImage("assets/images/profile.jpg"),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          "userProfile.name,",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        Text(
                          "userProfile.name,",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          "userProfile.name,",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        ProfileListtile(
                          icon: Icons.location_on_rounded,
                          title: "userProfile.name,",
                          arrowicon: Icons.edit,
                        ),
                        ProfileListtile(
                          icon: Icons.policy,
                          title: "Privacy Policy",
                          arrowicon: Icons.arrow_forward_ios_outlined,
                        ),
                        ProfileListtile(
                          icon: Icons.settings,
                          title: "Settings",
                          arrowicon: Icons.arrow_forward_ios_outlined,
                        ),
                        ProfileListtile(
                          icon: Icons.logout,
                          title: "Log Out",
                          arrowicon: Icons.arrow_forward_ios_outlined,
                          ontap: () {},
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: Text("Something Wrong"),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
