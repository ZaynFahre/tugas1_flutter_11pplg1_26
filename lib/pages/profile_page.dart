import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // foto profile dari lokal
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/mbeumo.jpg"),
            ),
            const SizedBox(height: 16),
            const Text(
              "Muhammad Zayyan Fahrezi",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Flutter Developer",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}