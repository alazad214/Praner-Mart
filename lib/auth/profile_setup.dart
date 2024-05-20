import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pranermart/controllers/profile_controller.dart';
import 'package:pranermart/widgets/custom_button.dart';
import 'package:pranermart/widgets/custom_textField.dart';

import '../screens/navigation_screen.dart';

class ProfileSetUP extends StatefulWidget {
  ProfileSetUP({super.key});

  @override
  State<ProfileSetUP> createState() => _ProfileSetUPState();
}

class _ProfileSetUPState extends State<ProfileSetUP> {
  final ImagePicker picker = ImagePicker();

  List<XFile>? images;
  formGallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  TextEditingController nameController = TextEditingController();
  XFile? image;
  final ImagePicker _picker = ImagePicker();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  final controller = Get.put(ProfileController());

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
                        Column(
                          children: [
                            CustomformField(
                              prefixicon:
                                  Icons.drive_file_rename_outline_rounded,
                              hinttext: "নাম",
                              onchanged: (value) {
                                controller.name.value = value;
                              },
                            ),
                            SizedBox(height: 10),
                            CustomformField(
                              prefixicon: Icons.email,
                              hinttext: "ইমেইল",
                              onchanged: (value) {
                                controller.email.value = value;
                              },
                            ),
                            SizedBox(height: 10),
                            CustomformField(
                              prefixicon: Icons.phone,
                              hinttext: "মোবাইল নাম্বার",
                              onchanged: (value) {
                                controller.phone.value = value;
                              },
                            ),
                            SizedBox(height: 10),
                            CustomformField(
                              prefixicon: Icons.location_on,
                              hinttext: "ঠিকানা",
                              onchanged: (value) {
                                controller.address.value = value;
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          ontap: () {
                            controller.Profile();
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
