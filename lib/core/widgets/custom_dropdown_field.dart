import 'package:flutter/material.dart';
import '../theme/denibook_theme.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final String label;
  final String hintText;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.hintText,
    required this.value,
    required this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: const TextStyle(
              color: DeniBookColors.textWhite,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
        ],
        DropdownButtonFormField<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          dropdownColor: DeniBookColors.surfaceCard,
          style: const TextStyle(color: DeniBookColors.textWhite, fontSize: 15),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: DeniBookColors.textMuted, fontSize: 14),
            filled: true,
            fillColor: DeniBookColors.surfaceCard,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: DeniBookColors.yellow, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
