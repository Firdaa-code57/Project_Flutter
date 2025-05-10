import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback toggleTheme;

  const ProfileScreen({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.black : Colors.grey[100];
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    final subTextColor = isDarkMode ? Colors.white54 : Colors.black54;
    final primaryColor = isDarkMode ? Colors.deepPurple : Colors.blueAccent;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color:
              isDarkMode
                  ? Colors.white
                  : Colors.white, // Menetapkan warna putih di kedua tema
        ),

        title: const Text(
          "Profil Pengguna",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white,
            ),
            onPressed: toggleTheme,
            tooltip: 'Ganti Tema',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              "Nama Pengguna",
              style: TextStyle(color: textColor, fontSize: 22),
            ),
            const SizedBox(height: 8),
            Text("email@pengguna.com", style: TextStyle(color: subTextColor)),
            const SizedBox(height: 30),
            Text(
              "Informasi lain bisa ditambahkan di sini.",
              style: TextStyle(color: subTextColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
