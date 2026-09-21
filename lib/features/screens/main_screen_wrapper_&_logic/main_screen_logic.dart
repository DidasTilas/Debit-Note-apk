import '../../../features/Dashboard//presentation/widgets/latest_arrival_view_card.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/bottom_navigation_bar.dart';
import '../../../features/Customers//presentation/widgets/debt_viewing_card.dart';

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
    LatestArrivalCardContainer(
      isComplete: false,
      currentCard: _currentCard,
      onCard: _onCardTapped,
    ),
    DebtViewingCard(
      currentCard: _currentCard,
      onCard: _onCardTapped,
      isComplete: false,
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
        appBar: AppBar(
          title: Text(_pageTitles[_selectedTab]),
        ),
        body: _pages[_selectedTab],
        bottomNavigationBar: MyBottomNavigationBar(
          currentTab: _selectedTab,
          onTab: _onOptionTapped,
        )
    );
  }
}