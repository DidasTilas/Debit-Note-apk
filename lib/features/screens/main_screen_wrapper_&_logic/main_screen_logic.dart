import '../../../features/Dashboard//presentation/widgets/latest_arrival_view_card.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../Dashboard/presentation/screens/home_dashboard_page.dart';
import '../../../core/widgets/bottom_navigation_bar.dart';
import '../../Customers/presentation/widgets/user_profile_customerscreen.dart';

class MainScreenLogic extends StatefulWidget {
  const MainScreenLogic({super.key});


  @override
  State<MainScreenLogic> createState() => _MainScreenLogicState();

}

class _MainScreenLogicState extends State<MainScreenLogic> {

  int _selectedTab = 0;
  int _currentCard = -1;

  static const List<String> _pageTitles = [
    'Home Page',
    'Debts Page',
    'Edit Page',
    'Settings Page',
  ];
  void _onCardTapped(int index) {
    setState(() {
      _currentCard = index;
    });
  }

  List<Widget> get _pages => [
    HomeDashboardPage(),
    UserProfileRow(
      customerName: 'Dayo',
      dayOfTransaction: '09, Oct 2026',
      aMount: 5600,
    ),
    Center(child: Text(_pageTitles[2], style: TextStyle(fontSize: 24, color: Colors.white))),
    Center(child: Text(_pageTitles[3], style: TextStyle(fontSize: 24, color: Colors.white))),
  ];

  void _onOptionTapped(int tab){
    setState(() {
      _selectedTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: _pages[_selectedTab],
        bottomNavigationBar: MyBottomNavigationBar(
          currentTab: _selectedTab,
          onTab: _onOptionTapped,
        )
    );
  }
}