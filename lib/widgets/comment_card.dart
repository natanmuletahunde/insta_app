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
          ),
          Padding(padding: 
          const  EdgeInsets.only(left: 16,),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
            RichText(text: TextSpan(
              children:[
                TextSpan(
                  text: 'username',
                  style: const TextStyle(fontWeight: FontWeight.bold)
                ),
                TextSpan(
                  text: 'some description to insert',
                 
                )
              ]
            )
            ),
            Padding(padding: 
            EdgeInsets.only(top: 4),
            child: Text('23/12/21',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold
            ),),)
           ],
          ),
           ),
           Container(
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.favorite,size: 16,),
           )
        ],
      ),
    );
  }
}