import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               SizedBox(height: 40), // Add spacing to move the image down
              CircleAvatar(
                radius: 50, // Adjust the radius to control the size
                backgroundImage: AssetImage('assets/images/ig.png'), // Path to the image file
              ),
               SizedBox(height: 20), // Additional spacing if needed
            ],
          ),
        ),
      ),
    );
  }
}
