import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  String? emailValidator(String? input) {
    if (input != null) {
      if (input.isEmpty) return 'email is required';
      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(input)) {
        return 'enter valid email';
      }
    }
    return null;
  }

  void onForgot() {
    if (formKey.currentState?.validate() ?? false) {}
  }

  void onBack() {
    Get.back();
  }

  void onNumber() {}
}
