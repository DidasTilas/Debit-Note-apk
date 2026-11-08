import 'package:flutter/material.dart';

class CustomCircleFloatingButton extends StatelessWidget {
  const CustomCircleFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.amberAccent,
      foregroundColor: Colors.black,
      // 🛑 Force the shape to be a perfect circle
      shape: const CircleBorder(),

      child: const Icon(Icons.add, size: 28),
    );
  }
}