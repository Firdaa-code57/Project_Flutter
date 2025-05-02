import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Function(bool) toggleTheme;

  const ProfileScreen({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: toggleTheme,
            ),
            const SizedBox(height: 30),
            // Tambahkan lebih banyak komponen di halaman profil agar lebih kompleks
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                title: const Text("Username"),
                subtitle: const Text("Project Flutter"),
                leading: const Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: ListTile(
                title: const Text("Email"),
                subtitle: const Text("projectflutter@gmail.com"),
                leading: const Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aksi logout atau lainnya
                Navigator.pop(context); // Kembali ke halaman login
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
