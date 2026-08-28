import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget{
  final int currentTab;
  final Function(int) onTab;

  const MyBottomNavigationBar({
    super.key,
    required this.currentTab,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border(
          top: BorderSide(
            color: Colors.blueAccent.withValues(alpha: 0.1),
            width: 0.5,
          )
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavbarOption(
            assetPath: 'assets/bottom_navbar_icons/home_.png',
            label: 'Home',
            isSelected: currentTab == 0,
            onTab: () => onTab(0),
          ),
          _NavbarOption(
              assetPath: 'assets/bottom_navbar_icons/shopping_cart_checkout_.png',
              label: 'Debts',
              isSelected: currentTab == 1,
              onTab: () => onTab(1),
          ),
          _NavbarOption(
              assetPath: 'assets/bottom_navbar_icons/edit_.png',
              label: 'Edit',
              isSelected: currentTab == 2,
              onTab: () => onTab(2),
          ),
          _NavbarOption(
              assetPath: 'assets/bottom_navbar_icons/settings_.png',
              label: 'Settings',
              isSelected: currentTab == 3,
              onTab: () => onTab(3),
          ),
        ],
      ),
    );
  }
}

class _NavbarOption extends StatelessWidget {
  final String assetPath;
  final String label;
  final bool isSelected;
  final VoidCallback onTab;

  const _NavbarOption({
    required this.assetPath,
    required this.label,
    required this.isSelected,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetPath,
              width: 24,
              height: 24,
              color: isSelected ? Colors.amberAccent : Colors.white70,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.amberAccent : Colors.white70,
                fontSize: 19,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
























