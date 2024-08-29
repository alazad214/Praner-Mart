import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pranermart/utils/colors.dart';
import 'package:pranermart/widgets/back_floatingButton.dart';
import 'package:pranermart/widgets/custom_button.dart';
import '../../../widgets/custom_textField.dart';
import '../../../widgets/text_rich_one.dart';
import '../controller/auth_controller.dart';
import '../utils/inputValidator.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final controller = Get.put(AuthController());
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
                          vertical: 30, horizontal: 20),
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
                            "FORGET NOW",
                            style: TextStyle(
                                color: AppColor.yaleBlue,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 30),

                          ///email textfield...
                          CustomformField(
                            prefixicon: Icons.email,
                            hinttext: "Email",
                            onchanged: (value) {
                              controller.email.value = value;
                            },
                            validation: InputValidator.validateEmail,
                          ),

                          const SizedBox(height: 20),

                          ///Login Button...
                          CustomButton(
                            text: "SUBMIT",
                            ontap: () {
                              if (formKey.currentState!.validate()) {
                                controller.LogIn();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),

                    /// Note...
                    TextRichOne(
                      text2:
                          'Provide your registered email here then click submit button Check your email A message has been sent to your email Click on that message Add new password',
                      textSize2: 14.0,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: BackFloatingbutton()
    );
  }
}
