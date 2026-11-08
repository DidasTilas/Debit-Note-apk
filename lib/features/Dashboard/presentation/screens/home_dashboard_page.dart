import 'package:flutter/material.dart';
import '../../../../core/theme/denibook_theme.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/dashboard_greetings.dart';
import '../../../../core/widgets/dashboard_arcs.dart';
import '../../../ledgers/presentation/screens/record_credit_screen.dart';
import '../widgets/recent_transaction_divider_&_window.dart';

class HomeDashboardPage extends StatelessWidget {
  const HomeDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DeniBookColors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DashboardGreetings(),
            const SizedBox(height: 12),
            const DashboardArcs(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomButton(
                text: 'Record Transaction',
                icon: Icons.add,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RecordCreditScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            const RecentTransactionDivider(),
          ],
        ),
      ),
    );
  }
}
