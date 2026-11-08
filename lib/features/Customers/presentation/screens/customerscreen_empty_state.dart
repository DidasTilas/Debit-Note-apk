import 'package:flutter/material.dart';
import '../../../../core/theme/denibook_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import 'add_customer_screen.dart';

class CustomersEmptyState extends StatelessWidget {
  const CustomersEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(28),
              decoration: const BoxDecoration(
                color: DeniBookColors.surfaceCard,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.groups_outlined,
                size: 80,
                color: DeniBookColors.textMuted,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'No customers yet',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: DeniBookColors.textWhite,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Add your first customer to get started.',
              style: TextStyle(
                fontSize: 14,
                color: DeniBookColors.textMuted,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: 220,
              child: CustomButton(
                text: 'Add Customer',
                icon: Icons.add,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddCustomerScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
