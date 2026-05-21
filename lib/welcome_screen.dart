import 'package:flutter/material.dart';
import 'login_page.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // ৩ সেকেন্ড পর অটোমেটিক লগইন পেজে নিয়ে যাবে
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          // একটি প্রিমিয়াম ডার্ক ব্লু গ্রেডিয়েন্ট ব্যাকগ্রাউন্ড
          gradient: LinearGradient(
            colors: [Color(0xFF1A237E), Color(0xFF3949AB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // একটি উজ্জ্বল কুইজ আইকন
            const Icon(
              Icons.school_rounded,
              size: 120,
              color: Colors.white,
            ),
            const SizedBox(height: 30),
            // আপনার কাঙ্ক্ষিত টেক্সট
            const Text(
              "Welcome to NUBTK",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
            const Text(
              "CSE Department",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white70,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 60),
            // একটি সুন্দর লোডিং বার
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
            ),
            const SizedBox(height: 20),
            const Text(
              "Loading your quiz...",
              style: TextStyle(color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }
}