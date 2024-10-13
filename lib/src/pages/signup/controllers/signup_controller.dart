import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../infrastructure/common/models/account.dart';
import '../../../infrastructure/common/database.dart';

class SignupController extends GetxController {
  //* Variables
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  RxBool isObscure = false.obs;
  RxBool isRemember = false.obs;

  // Dropdown ===============================================================
  List<DropdownMenuItem<String>> itemCountries = [];
  List<String> countriesCode = Database.countiresCode;
  RxString country = Database.countiresCode[0].obs;
  void _itemsToDropDown() {
    // changing string list to dropdown item list
    itemCountries = countriesCode
        .map(
          (e) => DropdownMenuItem<String>(
            value: e,
            child: Text('(+$e)'),
          ),
        )
        .toList();
  }

  void selectNumber(String? value) {
    country.value = value!;
  }

  // Check box ==============================================================
  RxBool checkBoxValue = false.obs;
  void check(bool? value) => checkBoxValue.value = value!;

  // password validation ====================================================
  RxInt value = 0.obs;
  RegExp numberRegex = RegExp(r'.*[0-9].*');
  RegExp letterRegex = RegExp(r'.*[A-Z].*');
  RegExp specialCharacters = RegExp(r'.*[\!\$\%\&\*\_\+\-\=\@\~\?\;\#]');

  void passValue(String input) {
    if (input.isEmpty) {
      value.value = 0;
    } else if (input.length < 6) {
      value.value = 1;
    } else if (input.length < 8) {
      value.value = 2;
    } else {
      if (!numberRegex.hasMatch(input) || !letterRegex.hasMatch(input)) {
        value.value = 3;
      } else if (!specialCharacters.hasMatch(input)) {
        value.value = 4;
      } else {
        value.value = 5;
      }
    }
  }

  String? passwordValidor(String? input) {
    if (input != null) {
      if (input.isEmpty) return 'password is required';
      if (input.length < 8) return 'password length should be longer than 8';
    }
    return null;
  }

  void toggle() => isObscure.toggle();

  // ========================================================================
  String? emailValidor(String? input) {
    if (input != null) {
      if (input.isEmpty) return 'email is required';
      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(input)) {
        return 'enter valid email';
      }
    }
    return null;
  }

  String? phoneValidator(String? input) {
    if (input != null) {
      if (input.length < 10) {
        return 'should be 10 chars';
      }
    }
    return null;
  }

  void onTerms() {}

  void onSignin() {
    if (formKey.currentState?.validate() ?? false) {
      if (checkBoxValue.value == false) {
        Get.showSnackbar(
          GetSnackBar(
            margin: const EdgeInsets.all(12),
            borderRadius: 8,
            duration: const Duration(seconds: 5),
            isDismissible: true,
            message: 'please agree to Terms and Privacy !',
            backgroundColor: Colors.red.shade200,
          ),
        );
        return;
      }

      if (Database.accounts.any(
        (acc) =>
            (acc.email == emailController.text) ||
            (acc.number == phoneController.text),
      )) {
        Get.showSnackbar(
          GetSnackBar(
            margin: const EdgeInsets.all(12),
            borderRadius: 8,
            duration: const Duration(seconds: 5),
            isDismissible: true,
            message: 'this email or phone is already signed !',
            backgroundColor: Colors.red.shade200,
          ),
        );
      } else {
        Database.accounts.add(
          Account(
              name: 'name',
              email: emailController.text,
              imageUrl: '',
              messeges: [],
              number: phoneController.text,
              password: passwordController.text),
        );
        Get.back<List<String>>(
            result: [emailController.text, passwordController.text]);
      }
    }
  }

  void onLogin() => Get.back();

  @override
  void onInit() {
    super.onInit();
    _itemsToDropDown();
  }
}
