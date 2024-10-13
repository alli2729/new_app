import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_app/src/infrastructure/routes/route_names.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isObscure = false.obs;
  RxBool isRemember = false.obs;

  String? emailValidor(String? input) {
    if (input != null) {
      if (input.isEmpty) return 'email is required';
      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(input)) {
        return 'enter valid email';
      }
    }
    return null;
  }

  String? passwordValidor(String? input) {
    if (input != null) {
      if (input.isEmpty) return 'password is required';
      if (input.length < 8) return 'password length should be longer than 8';
    }
    return null;
  }

  void toggle() {
    isObscure.toggle();
  }

  void rememberToggle(bool? value) {
    value = isRemember.value;
    isRemember.toggle();
  }

  void onForgot() {
    Get.toNamed(RouteNames.forgot);
  }

  void onSignup() {
    Get.toNamed(RouteNames.signup);
  }

  void onLogin() {
    if (formKey.currentState?.validate() ?? false) {}
  }

  // other ways to login

  void onGmail() {}

  void onTwitter() {}

  void onApple() {}
}
