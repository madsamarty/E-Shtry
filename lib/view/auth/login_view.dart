import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/auth/register_view.dart';
import 'package:e_commerce/view/widgets/customs/custom_flat_button.dart';
import 'package:e_commerce/view/widgets/customs/custom_social_button.dart';
import 'package:e_commerce/view/widgets/customs/custom_text.dart';
import 'package:e_commerce/view/widgets/customs/custom_text_from_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

import '../../constants/constance.dart';

class LoginView extends GetWidget<AuthViewModel> {
  LoginView({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
        init: Get.find<AuthViewModel>(),
        builder: (controller) => controller.loading.value
            ? const Center(child: CircularProgressIndicator())
            : Scaffold(
                backgroundColor: backgroundColor,
                //resizeToAvoidBottomInset: false,
                body: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, top: 150),
                    child: Form(
                      key: _formKey,
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(
                              title: "Welcome,",
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            // Button
                            // Button
                            // Button
                            GestureDetector(
                              onTap: () {
                                Get.to(() => RegisterView());
                              },
                              child: const CustomText(
                                title: "SIGN UP",
                                fontSize: 16,
                                color: primaryColor,
                              ),
                            )
                          ],
                        ),
                        const CustomText(
                            title: "Sign in to Continue",
                            fontSize: 12,
                            color: Colors.grey),
                        const SizedBox(
                          height: 30,
                        ),
                        const CustomText(
                          title: "Email",
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        CustomTextFromField(
                            hint: "example@gmail.com",
                            controller: controller.emailController,
                            onSave: (value) {
                              controller.email = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter email";
                              }
                            }),

                        const SizedBox(
                          height: 16,
                        ),
                        const CustomText(
                          title: "Password",
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        CustomTextFromField(
                            hint: "*********",
                            obscure: true,
                            controller: controller.passwordController,
                            onSave: (value) {
                              controller.password = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter password";
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        const CustomText(
                          title: "Forget Password",
                          fontSize: 14,
                          alignment: Alignment.centerRight,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // SignIn Button
                        CustomTextButton(
                          onPress: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              controller.signInWithEmailAndPassword();
                            } else {
                              print("Error state");
                            }
                          },
                          title: "SIGN IN",
                        ),

                        const SizedBox(
                          height: 40,
                        ),
                        // -OR-
                        const CustomText(
                          title: "-OR-",
                          alignment: Alignment.center,
                          fontSize: 18,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        // Button
                        CustomSocialButton(
                          onPress: () {
                            controller.facebookSignInMethod();
                          },
                          title: "Sign In with Facebook",
                          icon: "assets/images/facebook.png",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomSocialButton(
                          onPress: () {
                            controller.googleSignInMethod();
                          },
                          title: "Sign In with Google",
                          icon: "assets/images/google.png",
                        )
                      ]),
                    ),
                  ),
                ),
              ));
  }
}
