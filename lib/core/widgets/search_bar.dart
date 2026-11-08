import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final TextEditingController? controller;

  const CustomSearchBar({
    super.key,
    this.hintText = 'Search...',
    this.onChanged,
    this.onClear,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      hintText: hintText,
      padding: const WidgetStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 16.0),
      ),
      leading: const Icon(Icons.search),
      onChanged: onChanged,
      trailing: [
        if (controller != null && controller!.text.isNotEmpty)
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              controller!.clear();
              if (onClear != null) onClear!();
              if (onChanged != null) onChanged!('');
            },
          ),
      ],
    );
  }
}
