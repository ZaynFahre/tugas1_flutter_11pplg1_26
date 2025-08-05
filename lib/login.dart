import 'package:flutter/material.dart';
import 'home.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _statusLogin = "";

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome to our first app",
              style: TextStyle(
                fontSize: 15,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: Image.asset(
                'assets/mbeumo.jpg',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(height: 10),
            const Text("Please enter your username and password"),
            const SizedBox(height: 4),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: "Username",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;

                  if (username == "admin" && password == "admin123") {
                    setState(() {
                      _statusLogin = "sukses login";
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Login Berhasil\nUsername: $username"),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CalculatorPage(),
                      ),
                    );
                  } else {
                    setState(() {
                      _statusLogin = "gagal login";
                    });
                  }
                },
                child: const Text("Login"),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              _statusLogin,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                icon: const Icon(Icons.app_registration),
                label: const Text("Register"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
