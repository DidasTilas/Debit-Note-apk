import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../../../../core/theme/denibook_theme.dart';
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
    FlutterNativeSplash.remove();
    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DeniBookLoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DeniBookColors.black,
      body: Stack(
        children: [
          // Main Center Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: DeniBookColors.surfaceCard,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.account_balance_wallet,
                    size: 80,
                    color: DeniBookColors.yellow,
                  ),
                ),
                const SizedBox(height: 24),
                // App Title
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Deni',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: DeniBookColors.textWhite,
                        ),
                      ),
                      TextSpan(
                        text: 'Book',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: DeniBookColors.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Subtitle / Slogan
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    'Track Sales. Manage Debts.\nGrow Your Business.',
                    style: TextStyle(
                      fontSize: 16,
                      color: DeniBookColors.textMuted,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 60),
                // Loading Spinner
                const CircularProgressIndicator(
                  color: DeniBookColors.yellow,
                  strokeWidth: 3,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Loading...',
                  style: TextStyle(
                    color: DeniBookColors.textMuted,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Bottom Yellow Decorative Curve
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: BottomWaveClipper(),
              child: Container(
                height: 80,
                color: DeniBookColors.yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(
      size.width * 0.5,
      0,
      size.width,
      size.height * 0.4,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
