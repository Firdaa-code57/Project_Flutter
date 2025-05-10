import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:get_storage/get_storage.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  late GetStorage _storage;

  @override
  void initState() {
    super.initState();
    _storage = GetStorage();
    // Inisialisasi session, misalnya cek apakah pengguna sudah login
    bool isLoggedIn = _storage.read('isLoggedIn') ?? false;
    if (!isLoggedIn) {
      // Arahkan pengguna ke halaman login jika belum login
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
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
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Simulasi logout
          GetStorage().write('isLoggedIn', false);
          Navigator.pushReplacementNamed(context, '/login');
        },
        child: const Text('Logout'),
      ),
    );
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
