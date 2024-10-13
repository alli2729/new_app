import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/account_widget.dart';
import '../controllers/accounts_controller.dart';

class AccountsView extends GetView<AccountsController> {
  const AccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
      child: Column(
        children: [
          _appBar(),
          const SizedBox(height: 12),
          _accountText(),
          const SizedBox(height: 36),
          _existingAcc(),
          const SizedBox(height: 26),
          Expanded(child: _accounts()),
          const SizedBox(height: 12),
          _addButton(),
          const SizedBox(height: 26),
        ],
      ),
    );
  }

  //* Widgets =================================================================

  Widget _addButton() {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: controller.onAddAccount,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue,
        ),
        child: const Text(
          "Add another +",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _accounts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView.separated(
        itemCount: controller.accounts.length,
        itemBuilder: (context, index) => AccountWidget(
          account: controller.accounts[index],
          isActive: (controller.name == controller.accounts[index].name)
              ? true
              : false,
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 42),
      ),
    );
  }

  Widget _existingAcc() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Your Existing accounts', style: TextStyle(fontSize: 16)),
        GestureDetector(
          child: const Text(
            'Manage account',
            style: TextStyle(fontSize: 16, color: Colors.orange),
          ),
        ),
      ],
    );
  }

  Widget _accountText() {
    return const Text(
      'Add another account - so you can switch between them easily.',
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
        Icon(Icons.person, color: Colors.orange),
        SizedBox(width: 16),
        Text(
          'Accounts',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
