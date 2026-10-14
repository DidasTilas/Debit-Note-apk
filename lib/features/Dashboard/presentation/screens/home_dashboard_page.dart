import 'package:flutter/material.dart';
import '../../../../core/widgets/dashboard_greetings.dart';
import '../../../../core/widgets/dashboard_arcs.dart';
import '../widgets/recent_transaction_divider_&_window.dart';

class HomeDashboardPage extends StatefulWidget {
  const HomeDashboardPage({super.key});

  @override
  State<HomeDashboardPage> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DashboardGreetings(),
          SizedBox(height: 8),
          DashboardArcs(),
          Expanded(
            child: RecentTransactionDivider(),
          ),
        ],
      ),
    );
  }
}
