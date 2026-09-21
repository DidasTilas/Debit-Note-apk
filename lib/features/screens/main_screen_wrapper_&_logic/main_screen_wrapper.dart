import 'package:flutter/cupertino.dart';
import 'package:my_demo_flutter_app/features/screens/main_screen_wrapper_&_logic/main_screen_logic.dart';

class MainScreenWrapper extends StatelessWidget {
  const MainScreenWrapper({super.key});

  @override
  Widget build(BuildContext context){
    return MainScreenLogic();
  }
}