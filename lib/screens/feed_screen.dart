import 'package:flutter/material.dart';
import 'package:instagram/utils/colors.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: Image.asset(
          'assets/ig_feed.png', // Path to your image asset
          height: 32,
          color: primaryColor, // Optional: if you want to apply a color overlay
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.message_outlined),
          ),
        ],
      ),
    );
  }
}
