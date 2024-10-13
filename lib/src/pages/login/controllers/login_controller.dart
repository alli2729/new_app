import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/common/database.dart';
import '../../../infrastructure/routes/route_names.dart';

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

  void toggle() => isObscure.toggle();

  void rememberToggle(bool? value) {
    value = isRemember.value;
    isRemember.toggle();
  }

  void onForgot() {
    Get.toNamed(RouteNames.forgot);
  }

  void onSignup() async {
    final result = await Get.toNamed(RouteNames.signup);
    if (result != null) {
      emailController.text = result[0];
      passwordController.text = result[1];
    }
  }

  void onLogin() {
    if (formKey.currentState?.validate() ?? false) {
      bool isfound = Database.accounts.any(
        (acc) =>
            (acc.email == emailController.text) &&
            (acc.password == passwordController.text),
      );

      (isfound)
          ? Get.offNamed(RouteNames.home)
          : Get.showSnackbar(
              GetSnackBar(
                margin: const EdgeInsets.all(12),
                borderRadius: 8,
                duration: const Duration(seconds: 2),
                isDismissible: true,
                message: 'User not found !',
                backgroundColor: Colors.red.shade200,
              ),
            );
    }
  }

  // other ways to login

  void onGmail() {}

  void onTwitter() {}

  void onApple() {}
}
