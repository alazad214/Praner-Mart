import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pranermart/screens/home_screen.dart';
import 'package:pranermart/widgets/custom_button.dart';
import 'package:pranermart/widgets/custom_textField.dart';

class ProfileSetUP extends StatefulWidget {
  ProfileSetUP({super.key});

  @override
  State<ProfileSetUP> createState() => _ProfileSetUPState();
}

class _ProfileSetUPState extends State<ProfileSetUP> {
  final ImagePicker picker = ImagePicker();
  XFile? image;
  List<XFile>? images;
  formGallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (image == null)
                          InkWell(
                            onTap: () {
                              formGallery();
                            },
                            child: Container(
                              height: 80,
                              width: 80,
                              alignment: Alignment.bottomRight,
                              decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/profile.jpg"),
                                      fit: BoxFit.cover)),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.blue,
                              ),
                            ),
                          )
                        else
                          InkWell(
                            onTap: () {
                              formGallery();
                            },
                            child: Container(
                              height: 80,
                              width: 80,
                              alignment: Alignment.bottomRight,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: FileImage(File(image!.path)),
                                      fit: BoxFit.cover)),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        const SizedBox(height: 15),
                        const Column(
                          children: [
                            CustomformField(
                              prefixicon:
                                  Icons.drive_file_rename_outline_rounded,
                              hinttext: "নাম",
                            ),
                            SizedBox(height: 10),
                            CustomformField(
                              prefixicon: Icons.email,
                              hinttext: "ইমেইল",
                            ),
                            SizedBox(height: 10),
                            CustomformField(
                              prefixicon: Icons.phone,
                              hinttext: "মোবাইল নাম্বার",
                            ),
                            SizedBox(height: 10),
                            CustomformField(
                              prefixicon: Icons.location_on,
                              hinttext: "ঠিকানা",
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          ontap: () {
                            Get.offAll(() => HomeScreen());
                          },
                          text: "সম্পন্ন করুন",
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
