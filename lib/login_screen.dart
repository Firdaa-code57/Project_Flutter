import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordNyala = true;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void togglePasswordVisibility() {
    setState(() {
      passwordNyala = !passwordNyala;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Warna berdasarkan tema
    final backgroundColor =
        Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : Colors.white; // Menggunakan warna putih untuk background
    final inputFillColor =
        Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.grey[200]; // Warna input field lebih terang
    final textColor =
        Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black87; // Warna teks lebih gelap di light mode
    final hintColor =
        Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[400]
            : Colors
                .grey[600]; // Warna hint text yang lebih cocok untuk light mode

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[900]
                : Colors.blueAccent, // Warna app bar menyesuaikan dengan tema
        title: Text('Login', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Selamat Datang!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // Username
                TextField(
                  controller: _usernameController,
                  style: TextStyle(color: textColor),
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(color: hintColor),
                    prefixIcon: Icon(Icons.person, color: hintColor),
                    filled: true,
                    fillColor: inputFillColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Password
                TextField(
                  controller: _passwordController,
                  obscureText: passwordNyala,
                  style: TextStyle(color: textColor),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: hintColor),
                    prefixIcon: Icon(Icons.lock, color: hintColor),
                    suffixIcon: IconButton(
                      icon: Icon(
                        passwordNyala ? Icons.visibility_off : Icons.visibility,
                        color: hintColor,
                      ),
                      onPressed: togglePasswordVisibility,
                    ),
                    filled: true,
                    fillColor: inputFillColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.deepPurple
                            : Colors.blueAccent, // Sesuaikan warna tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/profile',
                    ); // Navigasi ke halaman profile
                  },
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
