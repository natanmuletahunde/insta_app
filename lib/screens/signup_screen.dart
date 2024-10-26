import 'dart:typed_data'; // For Uint8List
import 'dart:io'; // For File operations
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/resources/auth_methods.dart';
import 'package:instagram/widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  
  File? _image; // To store the selected image as a File
  Uint8List? _imageBytes; // To store the converted Uint8List

  // Dispose controllers when not in use
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  // Method to pick image from the gallery and convert it to Uint8List
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final File selectedImage = File(image.path);
      final Uint8List imageBytes = await selectedImage.readAsBytes();

      setState(() {
        _image = selectedImage;
        _imageBytes = imageBytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                
                // Profile picture section
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 64,
                      backgroundImage: _image != null
                          ? FileImage(_image!) // Display selected image
                          : const AssetImage('assets/images/ig.png') as ImageProvider, // Default image if none selected
                    ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: _pickImage, // Trigger image picker
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                
                // Input fields
                TextFieldInput(
                  hintText: 'Enter your email',
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _emailController,
                  isPass: false,
                ),
                const SizedBox(height: 20),
                TextFieldInput(
                  hintText: 'Enter your username',
                  textInputType: TextInputType.text,
                  textEditingController: _usernameController,
                  isPass: false,
                ),
                const SizedBox(height: 20),
                TextFieldInput(
                  hintText: 'Enter your password',
                  textInputType: TextInputType.text,
                  textEditingController: _passwordController,
                  isPass: true,
                ),
                const SizedBox(height: 20),
                TextFieldInput(
                  hintText: 'Enter your bio',
                  textInputType: TextInputType.text,
                  textEditingController: _bioController,
                  isPass: false,
                ),
                const SizedBox(height: 20),

                // Sign Up button
                GestureDetector(
                  onTap: () async {
                    if (_imageBytes != null) { // Check if image is selected
                      final authMethods = AuthMethods();
                      String res = await authMethods.signUpUser(
                        email: _emailController.text,
                        name: _usernameController.text,
                        password: _passwordController.text,
                        bio: _bioController.text,
                        username: _usernameController.text,
                        file: _imageBytes!, // Pass Uint8List for the profile picture
                      );
                      print(res); // Output success or error message
                    } else {
                      print("Please select a profile picture.");
                    }
                  },
                  child: Container(
                    child: const Text('Sign Up'),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Toggle for Sign In
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text('Already have an account?  '),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add navigation to Sign In screen here
                      },
                      child: Container(
                        child: const Text(
                          'Log in',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
