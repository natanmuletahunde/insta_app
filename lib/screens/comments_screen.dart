import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instagram/utils/colors.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Comments'),
        centerTitle: false,
      ),

    bottomNavigationBar: SafeArea(child: Container(
      height: kToolbarHeight,
      margin:EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      padding: const EdgeInsets.only(left: 16, right: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(''),
            radius: 18,

          ),
          Expanded(child: 
          Padding(padding: EdgeInsets.only(left: 16, right: 8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Comments as username',
              border: InputBorder.none,
            ),
          ),
          ),
          ),
            InkWell(
              onTap: (){},
            )
        ],
      ),
    )),  
    );
  }
}