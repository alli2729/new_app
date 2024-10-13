import 'package:flutter/material.dart';

class PasswordValid extends StatelessWidget {
  PasswordValid({super.key, required this.number});

  final int number;
  final List<bool> list = [
    false,
    false,
    false,
    false,
    false,
  ];

  void _fill() {
    for (var i = 0; i < number; i++) {
      list[i] = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    _fill();
    return Row(
      children: [
        _box(0),
        const SizedBox(width: 4),
        _box(1),
        const SizedBox(width: 4),
        _box(2),
        const SizedBox(width: 4),
        _box(3),
        const SizedBox(width: 4),
        _box(4),
      ],
    );
  }

  Widget _box(int index) {
    Color color = Colors.red;
    switch (number) {
      case 1:
        color = Colors.red;
      case 2:
        color = Colors.orange;
      case 3:
        color = Colors.yellow;
      case 4:
        color = Colors.lightGreen;
      case 5:
        color = Colors.green;
      default:
        color = Colors.blue;
    }

    return Expanded(
      flex: 1,
      child: Container(
        height: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: list[index] ? color : Colors.grey,
        ),
      ),
    );
  }
}
