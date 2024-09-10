import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pranermart/app/auth/utils/inputValidator.dart';
import 'package:pranermart/widgets/custom_textField.dart';
import '../../../utils/colors.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/custom_button.dart';
import '../../profile/controller/profile_controller.dart';

class ProfileSetup extends StatelessWidget {
  ProfileSetup({super.key});
  final controller = Get.put(ProfileController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.cornsilk,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ///Title...
                          Text(
                            "PROFILE SETUP",
                            style: TextStyle(
                                color: AppColor.yaleBlue,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 30),

                          CustomformField(
                            prefixicon: Icons.drive_file_rename_outline_rounded,
                            hinttext: "Name",
                            validation: InputValidator.validateUsername,
                            onchanged: (value) {
                              controller.name.value = value;
                            },
                          ),
                          SizedBox(height: 10),
                          CustomformField(
                            prefixicon: Icons.email,
                            hinttext: "Email",
                            validation: InputValidator.validateEmail,
                            onchanged: (value) {
                              controller.email.value = value;
                            },
                          ),
                          SizedBox(height: 10),
                          CustomformField(
                            prefixicon: Icons.phone,
                            inputType: TextInputType.phone,
                            hinttext: "Mobile",
                            validation: InputValidator.validatenumber,
                            onchanged: (value) {
                              controller.phone.value = value;
                            },
                          ),
                          SizedBox(height: 10),
                          CustomformField(
                            prefixicon: Icons.location_on,
                            hinttext: "Address",
                            validation: InputValidator.validateaddress,
                            onchanged: (value) {
                              controller.address.value = value;
                            },
                          ),
                          SizedBox(height: 20),

                          ///Submit Button...
                          Obx(() => AppButton(
                                isLoading: controller.isLoading.value,
                                loadingText: 'SUBMIT LOADING',
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    controller.Profile();
                                  }
                                },
                                text: "SUBMIT",
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
