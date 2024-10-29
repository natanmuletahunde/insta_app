import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final String datePublished;
  final List postUrl;
  final List profImage;
  final likes;


  const  Post ({
    required this.description,
    required this.uid,
    required this.username,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage, 
    required this.likes, 

  });
    Map<String ,dynamic> toJson()=>{
      'username': description,
      'uid': uid,
      'username': username,
      'postId': postId,
      'postUrl': postUrl,
      'profImage': profImage,
      'likes': likes,
      'datePublished':datePublished,
    };

  static Post fromSnap(DocumentSnapshot snap){
    var snapshot =  snap.data() as Map<String, dynamic>;

    return Post(
      username: snapshot['username'],
      uid: snapshot['uid'],
      datePublished: snapshot['datePublished'],
      description: snapshot['description'],
      profImage: snapshot['profImage'],
      postUrl: snapshot['postUrl'] ,
      likes: snapshot['likes'], 
      postId:snapshot['postId'] 
      // assuming 'following' is a list of user IDs
    );
  }
}