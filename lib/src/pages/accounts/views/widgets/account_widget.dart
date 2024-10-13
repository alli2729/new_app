import 'package:flutter/material.dart';
import '../../../../infrastructure/common/models/account.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({
    super.key,
    required this.account,
    required this.isActive,
  });

  final Account account;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _avatar(),
        const SizedBox(width: 18),
        _info(),
        const Spacer(),
        _checkBoxOrNumbers(),
      ],
    );
  }

  Widget _checkBoxOrNumbers() {
    if (isActive) {
      return Checkbox(
        activeColor: Colors.blue,
        value: isActive,
        onChanged: (value) {},
      );
    }
    return Container(
      margin: const EdgeInsets.only(right: 6),
      alignment: Alignment.center,
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.grey[300],
      ),
      child: Text(
        account.messeges.length.toString(),
        style: const TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          account.name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          account.email,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _avatar() {
    return const CircleAvatar(
      backgroundColor: Colors.blue,
      radius: 22,
      child: Icon(Icons.person, color: Colors.white),
    );
  }
}
