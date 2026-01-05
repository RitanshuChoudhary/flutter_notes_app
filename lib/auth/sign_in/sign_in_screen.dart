import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_demo/auth/sign_in/sign_in_controller.dart';
import 'package:notes_demo/routes/routes.dart';

import '../../widgets/common_widgets.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage('assets/images/background_image.jpg'),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const ImageIcon(
                AssetImage("assets/images/plant.png"),
                color: Colors.white,
                size: 120,
              ),
              const SizedBox(height: 50),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 20.0,
                    ),
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Welcome back",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            const Text(
                              "Login to your account",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 40),
                            EntryField(
                              hintText: "Email / Username",
                              controller: controller.emailController,
                            ),
                            const SizedBox(height: 20),
                            EntryField(
                              hintText: "Password",
                              controller: controller.passwordController,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Forgot password?",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 158),
                        Obx(
                          () => Button(
                            text: "Login",
                            textColor: Colors.white,
                            buttonColor: Colors.greenAccent[700],
                            isLoading: controller.isLoading.value,
                            onTap: controller.signIn,
                          ),
                        ),
                        const SizedBox(height: 7),
                        InkWell(
                          onTap: () => Get.toNamed(Routes.signUp),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                color: Color(0xff036E48),
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: "Sign up",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
