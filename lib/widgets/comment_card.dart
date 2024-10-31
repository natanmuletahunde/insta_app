import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({super.key});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 16
      ),
      child:Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1730051316601-4c71c894e496?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGNvbWV0fGVufDB8fDB8fHww'),
              radius: 18,
          )
        ],
      ),
    );
  }
}