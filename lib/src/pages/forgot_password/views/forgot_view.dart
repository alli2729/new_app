import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/forgot_controller.dart';

class ForgotView extends GetView<ForgotController> {
  const ForgotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
      child: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _appBar(),
              const SizedBox(height: 12),
              _resetText(),
              const SizedBox(height: 64),
              _emailText(),
              const SizedBox(height: 12),
              _emailField(),
              const SizedBox(height: 24),
              _forgetButton(),
              const SizedBox(height: 48),
              _phoneNumber(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  //* Widgets =================================================================

  Widget _phoneNumber() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Forgot your email? ",
          style: TextStyle(fontSize: 14),
        ),
        GestureDetector(
          onTap: controller.onNumber,
          child: const Text(
            "Try phone number",
            style: TextStyle(fontSize: 16, color: Colors.blue),
          ),
        ),
      ],
    );
  }

  Widget _forgetButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: controller.onForgot,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue,
        ),
        child: const Text(
          'Send link',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      controller: controller.emailController,
      validator: controller.emailValidator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
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

  Widget _resetText() {
    return const Text(
      'Enter your email that you used to register your account, so we can send you a link to reset your password.',
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    );
  }

  Widget _appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(Icons.lock, color: Colors.orange),
        const SizedBox(width: 16),
        const Text(
          'Forgot password?',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
          onPressed: controller.onBack,
          icon: const Icon(Icons.cancel_outlined, size: 22),
        ),
      ],
    );
  }
}
