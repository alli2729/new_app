import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/password_valid.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

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
              _signupText(),
              const SizedBox(height: 12),
              _emailText(),
              const SizedBox(height: 12),
              _emailField(),
              const SizedBox(height: 18),
              _phoneText(),
              const SizedBox(height: 12),
              _phoneRow(),
              const SizedBox(height: 12),
              _passwordText(),
              const SizedBox(height: 12),
              _passwordField(),
              const SizedBox(height: 20),
              Obx(() => PasswordValid(number: controller.value.value)),
              const SizedBox(height: 20),
              _agreement(),
              const SizedBox(height: 24),
              _signinButton(),
              const SizedBox(height: 24),
              _haveAccount(),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  //* Widgets =================================================================

  Widget _haveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have account?  ",
          style: TextStyle(fontSize: 14),
        ),
        GestureDetector(
          onTap: controller.onLogin,
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 16, color: Colors.blue),
          ),
        ),
      ],
    );
  }

  Widget _signinButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: controller.onSignin,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue,
        ),
        child: const Text(
          "Let's roll",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _agreement() {
    return Row(
      children: [
        Obx(
          () => Checkbox(
            activeColor: Colors.orange,
            value: controller.checkBoxValue.value,
            onChanged: controller.check,
          ),
        ),
        Row(
          children: [
            const Text(
              'I Agree With ',
              style: TextStyle(fontSize: 16),
            ),
            GestureDetector(
              onTap: controller.onTerms,
              child: const Text(
                'Terms And Privacy',
                style: TextStyle(fontSize: 16, color: Colors.orange),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _passwordField() {
    return Obx(
      () => TextFormField(
        obscuringCharacter: '*',
        onChanged: controller.passValue,
        obscureText: controller.isObscure.value,
        controller: controller.passwordController,
        keyboardType: TextInputType.visiblePassword,
        validator: controller.passwordValidor,
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

  Widget _phoneRow() {
    return Row(
      children: [
        Obx(
          () => DropdownButton(
            isDense: true,
            value: controller.country.value,
            items: controller.itemCountries,
            onChanged: controller.selectNumber,
            elevation: 0,
            dropdownColor: Colors.white,
            focusColor: Colors.white,
            underline: const SizedBox(),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 4,
          child: TextFormField(
            maxLength: 10,
            controller: controller.phoneController,
            validator: controller.phoneValidator,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.phone, color: Colors.grey),
              counterText: '',
              hintText: '1234567890',
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _phoneText() {
    return const Text(
      'Phone number',
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

  Widget _signupText() {
    return const Text(
      'Create youre account - enjoy our services with most updated features.',
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
        const Icon(Icons.person_add_alt_1, color: Colors.orange),
        const SizedBox(width: 16),
        const Text(
          'Sign up',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
          onPressed: controller.onLogin,
          icon: const Icon(Icons.cancel_outlined, size: 22),
        )
      ],
    );
  }
}
