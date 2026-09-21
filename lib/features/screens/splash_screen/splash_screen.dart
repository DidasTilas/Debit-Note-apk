import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../main_screen_wrapper_&_logic/main_screen_wrapper.dart';
import '../login_screen/login_screen.dart';

class DeniBookSplash extends StatefulWidget {
  const DeniBookSplash({super.key});

  @override
  State<DeniBookSplash> createState() => _DeniBookSplashState();
}

class _DeniBookSplashState extends State<DeniBookSplash> {

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() async {
    // Remove the native splash screen
    FlutterNativeSplash.remove();

    // Delay for a few seconds to show the Flutter splash screen content
    await Future.delayed(const Duration(seconds: 15));

    // Navigate to the main screen
    if (mounted) {
      Navigator.pushReplacement(
        context,
        //MaterialPageRoute(builder: (context) => const MainScreenWrapper()),
        MaterialPageRoute(builder: (context) => const DeniBookLoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
        children: [
          //logo for the splash page
          Padding(
            padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 200.0),
            child: Image.asset(
                'assets/icon/DeniBookSplash.png',
              height: 240,
            ),
          ),
          //center words "Track Sales, Manage Debts. Grow Your Business"
          const SizedBox(
              height: 55,
              width:260,
            child: Text(
              'Track Sales, Manage Debts.  Grow Your Business',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          const CircularProgressIndicator(
            color: Colors.amberAccent,
            strokeWidth: 3,
          ),
          Padding(
            padding: const  EdgeInsets.only(top: 11.0),
              child: Image.asset(
                  'assets/icon/DeniBookBanner.png'
              ),
          ),
        ],
      ),
      ),
    );
  }
}