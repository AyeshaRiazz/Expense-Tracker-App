// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Expense Tracker',

            // Force English locale
            locale: Locale('en', 'US'),

            theme: ThemeData.light().copyWith(
              primaryColor: Color(0xFF7C3AED),
              colorScheme: ColorScheme.light(
                primary: Color(0xFF7C3AED),
                secondary: Color(0xFF10B981),
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black87),
              ),
            ),
            darkTheme: ThemeData.dark().copyWith(
              primaryColor: Color(0xFF8B5CF6),
              colorScheme: ColorScheme.dark(
                primary: Color(0xFF8B5CF6),
                secondary: Color(0xFF34D399),
              ),
              scaffoldBackgroundColor: Color(0xFF1F2937),
              appBarTheme: AppBarTheme(
                backgroundColor: Color(0xFF1F2937),
                elevation: 0,
              ),
            ),
            themeMode: themeProvider.themeMode,
            debugShowCheckedModeBanner: false,
            home: LoginScreen(),
          );
        },
      ),
    );
  }
}