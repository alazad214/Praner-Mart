import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pranermart/app/auth/views/signup_screen.dart';
import 'package:pranermart/style/text_style.dart';
import 'package:pranermart/style/textfiled_style.dart';
import 'package:pranermart/utils/colors.dart';
import 'package:pranermart/widgets/app_button.dart';
import '../../../widgets/back_floatingButton.dart';
import '../../../widgets/text_rich_one.dart';
import '../../../controllers/auth_controller.dart';
import '../utils/inputValidator.dart';
import 'forget_password.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
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
                          vertical: 20, horizontal: 20),
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
                            "LOGIN NOW",
                            style: TextStyle(
                                color: AppColor.yaleBlue,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 30),

                          ///email textfield...
                          TextFormField(
                            decoration: appInputDecoration(
                                hinttext: 'Email', prefixIcon: Icons.email),
                            onChanged: (value) {
                              controller.email.value = value;
                            },
                            validator: InputValidator.validateEmail,
                          ),

                          SizedBox(height: 10),

                          ///password textfield...
                          Obx(() {
                            return TextFormField(
                              decoration: appInputDecoration(
                                hinttext: 'Password',
                                prefixIcon: controller.isObscure.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                ontap: () => controller.toggleObscureText(),
                              ),
                              onChanged: (value) {
                                controller.password.value = value;
                              },
                              validator: InputValidator.validatePassword,
                              obscureText: controller.isObscure.value,
                            );
                          }),

                          const SizedBox(height: 20),

                          ///Login Button...
                          Obx(() => AppButton(
                                isLoading: controller.isLoading.value,
                                loadingText: 'LOGIN LOADING',
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    controller.LogIn();
                                  }
                                },
                                text: "LOG IN",
                              )),

                          /// Forget Password...
                          const SizedBox(height: 10),
                          InkWell(
                              onTap: () => Get.to(() => ForgetPassword()),
                              child: Text(
                                'Forget',
                                style: head1TextStyle(),
                              ))
                        ],
                      ),
                    ),

                    ///Already Account...
                    SizedBox(height: 20.0),
                    TextRichOne(
                      text1: "Don't have an account? ",
                      text2: " Sign Up",
                      textSize1: 16.0,
                      textSize2: 16.0,
                      ontap: () => Get.to(
                        () => SignUpScreen(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: BackFloatingbutton());
  }
}
