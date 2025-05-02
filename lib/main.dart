import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Variabel untuk mengontrol tema (light or dark)
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(), // Tema terang
      darkTheme: ThemeData.dark(), // Tema gelap
      home: const LoginScreen(),
      routes: {
        '/profile':
            (context) => ProfileScreen(
              toggleTheme: (bool value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
      },
    );
  }
}
