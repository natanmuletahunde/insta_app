class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List follwers;
  final List following;


  const  User ({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.username,
    required this.bio,
    required this.follwers,
    required this.following, 
  });
    Map<String ,dynamic> toJson()=>{
      'username': username,
      'uid': uid,
      'email': email,
      'photoUrl': photoUrl,
      'bio': bio,
      'follwers': follwers,
      'following': following,
    };
}