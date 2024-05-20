import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pranermart/auth/login.dart';
import 'package:pranermart/controllers/auth_controller.dart';
import 'package:pranermart/widgets/custom_button.dart';
import 'package:pranermart/widgets/custom_textField.dart';

class Ragistation extends StatelessWidget {
  Ragistation({super.key});
  final _emailformkey = GlobalKey<FormState>();
  final _passformkey = GlobalKey<FormState>();
  final controller = Get.put(AuthController());

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
                        const Text(
                          "রেজিস্টার করুন",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30),
                        Column(
                          children: [
                            Form(
                              key: _emailformkey,
                              child: CustomformField(
                                prefixicon: Icons.email,
                                hinttext: "ইমেইল",
                                onchanged: (emeil) {
                                  controller.email.value = emeil;
                                },
                                validation: (value) {
                                  if (value!.isEmpty) {
                                    return "Fill The Form";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                            Form(
                              key: _passformkey,
                              child: CustomformField(
                                prefixicon: Icons.remove_red_eye_sharp,
                                hinttext: "পাসওয়ার্ড",
                                obscuretext: true,
                                onchanged: (password) {
                                  controller.password.value = password;
                                },
                                validation: (value) {
                                  if (value!.isEmpty) {
                                    return "Fill The Form";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                            CustomformField(
                              prefixicon: Icons.remove_red_eye_sharp,
                              hinttext: "আবার পাসওয়ার্ড",
                              obscuretext: true,
                              onchanged: (confirmpassword) {
                                controller.confirmpassword.value =
                                    confirmpassword;
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          text: "রেজিস্টার",
                          ontap: () {
                            if (_emailformkey.currentState!.validate() &&
                                _passformkey.currentState!.validate()) {
                              controller.Register();
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.offAll(() => const LogIn());
                              },
                              child: const Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "ইতিমধ্যে কোনো অ্যাকাউন্ট আছে? ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    )),
                                TextSpan(
                                    text: "লগইন",
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 14,
                                    )),
                              ])),
                            )
                          ],
                        )
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
