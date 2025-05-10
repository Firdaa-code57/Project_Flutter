import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'login_screen.dart';

void main() async {
  // Inisialisasi get_storage sebelum aplikasi dijalankan
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: _getInitialScreen(),
    );
  }

  Widget _getInitialScreen() {
    // Mengecek apakah sudah login menggunakan get_storage
    bool? isLoggedIn = GetStorage().read('isLoggedIn');
    if (isLoggedIn == true) {
      // Jika sudah login, langsung menuju halaman dashboard
      return const DashboardScreen();
    } else {
      // Jika belum login, tampilkan halaman login
      return LoginScreen(toggleTheme: toggleTheme);
    }
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Logout dan hapus status login
              GetStorage().write('isLoggedIn', false);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(toggleTheme: () {}),
                ),
              );
            },
          ),
        ],
      ),
      body: _getPage(_selectedIndex),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [Icons.home, Icons.search, Icons.person],
        activeIndex: _selectedIndex,
        onTap: _onItemTapped,
        gapLocation: GapLocation.none,
        elevation: 8,
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const SearchPage();
      case 2:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home Page'));
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Search Page'));
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Page'));
  }
}
