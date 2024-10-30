import 'package:flutter/material.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/widgets/post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        icon: Icon(Icons.message_outlined),
      ),
    ],
  ),

  body:const PostCard() ,
);

  }
}
