import 'package:flutter/material.dart';
import 'package:instagram/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               const SizedBox(height: 40), // Add spacing to move the image down
              const CircleAvatar(
                radius: 50, // Adjust the radius to control the size
                backgroundImage: AssetImage('assets/images/ig.png'), // Path to the image file
              ),
               const SizedBox(height: 20), // Additional spacing if needed
               
              TextFieldInput(
  hintText: 'Enter your email',
  textInputType: TextInputType.emailAddress,
  textEditingController: _emailController,
  isPass: false, // Since this is an email field, isPass should be false
)

            ],
          ),
        ),
      ),
    );
  }
}
