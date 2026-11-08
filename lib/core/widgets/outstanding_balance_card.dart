import 'package:flutter/material.dart';
import '../theme/denibook_theme.dart';

class OutstandingBalanceCard extends StatelessWidget {
  final String title;
  final String amount;

  const OutstandingBalanceCard({
    super.key,
    this.title = 'Outstanding Balance',
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: DeniBookColors.yellow,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: DeniBookColors.yellow.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            amount,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
