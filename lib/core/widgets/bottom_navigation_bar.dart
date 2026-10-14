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
            blurRadius: 1,
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
              icon: Icon(Icons.library_books_outlined, color: Colors.white70),
              activeIcon: Icon(Icons.library_books, color: Colors.amberAccent),
              label: 'Ledgers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.area_chart_outlined, color: Colors.white70),
              activeIcon: Icon(Icons.area_chart, color: Colors.amberAccent),
              label: 'Reports',
            ),
          ],
        ),
      ),
    );
  }
}