import 'package:flutter/material.dart';
import '../theme/denibook_theme.dart';

enum CustomerStatus { paid, owing, overdue }

class StatusBadge extends StatelessWidget {
  final CustomerStatus status;
  final String? label;

  const StatusBadge({
    super.key,
    required this.status,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color fg;
    String text;

    switch (status) {
      case CustomerStatus.paid:
        bg = DeniBookColors.paid.withOpacity(0.2);
        fg = DeniBookColors.paid;
        text = label ?? 'Paid';
        break;
      case CustomerStatus.owing:
        bg = DeniBookColors.owing.withOpacity(0.2);
        fg = DeniBookColors.owing;
        text = label ?? 'Owing';
        break;
      case CustomerStatus.overdue:
        bg = DeniBookColors.overdue.withOpacity(0.2);
        fg = DeniBookColors.overdue;
        text = label ?? 'Overdue';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: fg.withOpacity(0.5), width: 1),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: fg,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
