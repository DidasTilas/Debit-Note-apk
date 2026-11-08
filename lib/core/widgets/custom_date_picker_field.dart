import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../theme/denibook_theme.dart';

class CustomDatePickerField extends StatelessWidget {
  final String label;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const CustomDatePickerField({
    super.key,
    required this.label,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMM yyyy').format(selectedDate);

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
        InkWell(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2020),
              lastDate: DateTime(2030),
              builder: (context, child) {
                return Theme(
                  data: ThemeData.dark().copyWith(
                    colorScheme: const ColorScheme.dark(
                      primary: DeniBookColors.yellow,
                      onPrimary: Colors.black,
                      surface: DeniBookColors.surfaceCard,
                      onSurface: Colors.white,
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (picked != null) {
              onDateSelected(picked);
            }
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: DeniBookColors.surfaceCard,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white12),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today_outlined, color: DeniBookColors.yellow, size: 20),
                const SizedBox(width: 12),
                Text(
                  formattedDate,
                  style: const TextStyle(color: DeniBookColors.textWhite, fontSize: 15),
                ),
                const Spacer(),
                const Icon(Icons.arrow_drop_down, color: DeniBookColors.textMuted),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
