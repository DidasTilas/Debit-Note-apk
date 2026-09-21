import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentTab;
  final ValueChanged<int> onTab;

  const MyBottomNavigationBar({
    super.key,
    required this.currentTab,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withValues(alpha: 0.1),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: BottomNavigationBar(
          currentIndex: currentTab,
          onTap: onTab,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.amberAccent,
          unselectedItemColor: Colors.white70,
          selectedFontSize: 18,
          unselectedFontSize: 12,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, color: Colors.white70),
              activeIcon: Icon(Icons.home, color: Colors.amberAccent),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account_outlined,
                  color: Colors.white70),
              activeIcon: Icon(Icons.supervisor_account,
                  color: Colors.amberAccent),
              label: 'Customers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payments_outlined, color: Colors.white70),
              activeIcon: Icon(Icons.payments, color: Colors.amberAccent),
              label: 'Transactions',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined, color: Colors.white70),
              activeIcon: Icon(Icons.bar_chart, color: Colors.amberAccent),
              label: 'Reports',
            ),
          ],
        ),
      ),
    );
  }
}