import 'package:flutter/material.dart';
import 'package:my_demo_flutter_app/features/ledgers/presentation/screens/ledger_screen.dart';
import 'user_profile_homescreen.dart';

class RecentTransactionDivider extends StatelessWidget {
  const RecentTransactionDivider({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample transactions list
    final transactions = [
      {'name': 'Dayo', 'date': '07 Oct 2026', 'amount': 9500},
      {'name': 'Dayo', 'date': '07 Oct 2026', 'amount': 1200},
      {'name': 'Dayo', 'date': '07 Oct 2026', 'amount': 5800},
      {'name': 'Dayo', 'date': '07 Oct 2026', 'amount': 7200},
      {'name': 'Dayo', 'date': '07 Oct 2026', 'amount': 3400},
      {'name': 'Dayo', 'date': '07 Oct 2026', 'amount': 6100},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Title on the left, "View all" button on the right
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LedgersScreen()),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.amberAccent,
                ),
                child: const Text(
                  'View all',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Transaction List
          ListView.builder(
            itemCount: transactions.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final tx = transactions[index];
              return UserProfileRow(
                customerName: tx['name'] as String,
                dayOfTransaction: tx['date'] as String,
                aMount: tx['amount'] as int,
              );
            },
          ),
        ],
      ),
    );
  }
}
