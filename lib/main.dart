import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:my_demo_flutter_app/features/screens/main_screen_wrapper_&_logic/main_screen_wrapper.dart';
import 'package:my_demo_flutter_app/database/database_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_demo_flutter_app/features/screens/splash_screen/splash_screen.dart';

// Riverpod provider to make AppDatabase accessible globally across the app
final databaseProvider = Provider<AppDatabase>((ref) {
  throw UnimplementedError('databaseProvider must be initialized in main()');
});

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // 1. Explicitly initialize the database on startup
  final db = AppDatabase();

  // 2. Force Drift to open the database and create denibook.sqlite on disk IMMEDIATELY
  try {
    await db.customSelect('SELECT 1').get();
    print('✅ Database initialized successfully on disk!');
  } catch (e) {
    print('❌ Database initialization error: $e');
  }

  runApp(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(db),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeniBook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black12,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const DeniBookSplash(),
    );
  }
}
