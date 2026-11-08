import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/bottom_navigation_bar.dart';
import '../../Dashboard/presentation/screens/home_dashboard_page.dart';
import '../../Customers/presentation/screens/customers_screen.dart';
import '../../ledgers/presentation/screens/ledger_screen.dart';
import '../../reports/screens/reports_screen.dart';

class MainScreenLogic extends StatefulWidget {
  const MainScreenLogic({super.key});

  @override
  State<MainScreenLogic> createState() => _MainScreenLogicState();
}

class _MainScreenLogicState extends State<MainScreenLogic> {
  int _selectedTab = 0;

  List<Widget> get _pages => [
    const HomeDashboardPage(),
    const CustomersScreen(),
    const LedgersScreen(),
    const ReportsScreen(),
  ];

  void _onOptionTapped(int tab) {
    setState(() {
      _selectedTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: _pages[_selectedTab],
      bottomNavigationBar: MyBottomNavigationBar(
        currentTab: _selectedTab,
        onTab: _onOptionTapped,
      ),
    );
  }
}
