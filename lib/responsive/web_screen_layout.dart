import 'package:flutter/material.dart';
import 'package:instagram/utils/colors.dart';
class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold
        (
         appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: const Text(
          'Instagram',
          style: TextStyle(
            color: primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home),
          ),
           IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
           IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_a_photo),
          ),
           IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite),
          ),
           IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
        ],
      ),
          body: Text('web here'),
        );
    
  }
}