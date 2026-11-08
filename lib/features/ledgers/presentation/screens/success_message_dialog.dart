import 'package:flutter/material.dart';
import '../../../../core/theme/denibook_theme.dart';
import '../../../../core/widgets/custom_button.dart';

class SuccessMessageDialog extends StatelessWidget {
  final String title;
  final String amount;
  final String customerName;
  final String newBalance;
  final String date;

  const SuccessMessageDialog({
    super.key,
    required this.title,
    required this.amount,
    required this.customerName,
    required this.newBalance,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DeniBookColors.black,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Green Circle Checkmark
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: DeniBookColors.paid,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 64,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: DeniBookColors.textWhite,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  amount,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: DeniBookColors.yellow,
                  ),
                ),
                const SizedBox(height: 32),

                // Details Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: DeniBookColors.surfaceCard,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      _rowDetail('Customer', customerName),
                      const Divider(color: Colors.white10, height: 20),
                      _rowDetail('New Balance', newBalance),
                      const Divider(color: Colors.white10, height: 20),
                      _rowDetail('Date', date),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                CustomButton(
                  text: 'OK',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _rowDetail(String label, String val) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: DeniBookColors.textMuted, fontSize: 14)),
        Text(
          val,
          style: const TextStyle(
            color: DeniBookColors.textWhite,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
