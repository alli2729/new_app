import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _appBar(),
              const SizedBox(height: 12),
              _welcomeText(),
              const SizedBox(height: 24),
              _emailText(),
              const SizedBox(height: 12),
              _emailField(),
              const SizedBox(height: 18),
              _passwordText(),
              const SizedBox(height: 12),
              _passwordField(),
              const SizedBox(height: 12),
              _rememberAndForgot(),
              const SizedBox(height: 36),
              _loginButton(),
              const SizedBox(height: 12),
              _orText(),
              const SizedBox(height: 12),
              _otherRow(),
              const SizedBox(height: 24),
              _noAccount(),
            ],
          ),
        ),
      ),
    );
  }

  //* Widgets =================================================================

  Widget _otherRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _gmailButton(),
        const SizedBox(width: 16),
        _twitterButton(),
        const SizedBox(width: 16),
        _appleButton(),
      ],
    );
  }

  Widget _noAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have account? ",
          style: TextStyle(fontSize: 14),
        ),
        GestureDetector(
          onTap: controller.onSignup,
          child: const Text(
            "Sign up",
            style: TextStyle(fontSize: 16, color: Colors.blue),
          ),
        ),
      ],
    );
  }

  Widget _appleButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: controller.onApple,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        alignment: Alignment.center,
        // width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[300],
        ),
        child: const Text(
          'Apple Id',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _twitterButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: controller.onTwitter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        alignment: Alignment.center,
        // width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue[100],
        ),
        child: const Text(
          'Twitter',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _gmailButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: controller.onGmail,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        alignment: Alignment.center,
        // width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.red[100],
        ),
        child: const Text(
          'Google',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _orText() {
    return const Align(
      alignment: Alignment.center,
      child: Text(
        'or',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _loginButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: controller.onLogin,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue,
        ),
        child: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _rememberAndForgot() {
    return Obx(
      () => Row(
        children: [
          Checkbox(
            activeColor: Colors.blue,
            value: controller.isRemember.value,
            onChanged: controller.rememberToggle,
          ),
          const Text('Remember Me', style: TextStyle(fontSize: 16)),
          const Spacer(),
          GestureDetector(
            onTap: controller.onForgot,
            child: const Text(
              'Forgot Password ?',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _passwordField() {
    return Obx(
      () => TextFormField(
        obscuringCharacter: '*',
        obscureText: controller.isObscure.value,
        controller: controller.passwordController,
        validator: controller.passwordValidor,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          prefixText: '   ',
          suffixIcon: GestureDetector(
            onTap: controller.toggle,
            child: (controller.isObscure.value)
                ? const Icon(Icons.visibility_outlined, color: Colors.grey)
                : const Icon(Icons.visibility_off_outlined, color: Colors.grey),
          ),
          hintText: 'password',
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _passwordText() {
    return const Text(
      'Password',
      style: TextStyle(fontSize: 14),
    );
  }

  Widget _emailField() {
    return TextFormField(
      controller: controller.emailController,
      validator: controller.emailValidor,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.email_outlined, color: Colors.grey),
        prefixText: '   ',
        hintText: 'abc@email.com',
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _emailText() {
    return const Text(
      'Email',
      style: TextStyle(fontSize: 14),
    );
  }

  Widget _welcomeText() {
    return const Text(
      'Login to your account - enjoy exclusive features and many more',
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }

  Widget _appBar() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.person_add_alt_1, color: Colors.orange),
        SizedBox(width: 16),
        Text(
          'Login',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
