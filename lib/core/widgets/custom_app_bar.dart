import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  final String textOne = 'Deni';
  final String textTwo = 'Book';

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final rawCombinedText = TextSpan(
      children: [
        TextSpan(
          text: textOne,
          style: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        TextSpan(
          text: textTwo,
          style: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            color: Colors.amberAccent,
          ),
        ),
      ],
    );
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text.rich(rawCombinedText),
    );
  }
}
