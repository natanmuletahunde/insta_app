import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/models/user.dart';
import 'package:instagram/providers/user_provider.dart';
import 'package:instagram/resources/firestore_methods.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/utils.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
Uint8List? _file;// MUST BE NULLABLES
final  TextEditingController _descriptionController = TextEditingController();

void PostImage(
  String uid,
  String username,
  String profImage,
) async { // Moved 'async' here
  try {
    String res = await FirestoreMethods().uploadPost(
      _descriptionController.text, // Change _descriptionController to .text
      _file!,
      uid,
      username,
      profImage,
    );

    if (res == 'success') {
      showSnackBar('posted', context);
    } else {
      showSnackBar(res, context);
    }
  } catch (e) {
    showSnackBar(e.toString(), context);
  }
}


  _selectImage(BuildContext context)async {
    return showDialog(context:context ,builder: (context)
    {
      return SimpleDialog(
        title: const Text('create a Post'),
        children: [
          SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('take  photo'),
            onPressed: () async {
              Navigator.of(context).pop();
              Uint8List file = await pickImage(ImageSource.camera,);

              setState(() {
              _file= file;
              });
            }
            
          ),
           SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text('Choose from gallery  '),
            onPressed: () async {
              Navigator.of(context).pop();
              Uint8List file = await pickImage(ImageSource.gallery,);
              setState(() {
              _file= file;
              });
            }
            
          ),
           SimpleDialogOption(
            padding: const EdgeInsets.all(20),
            child: const Text(' Cancel'),
            onPressed: () async {
              Navigator.of(context).pop();// used to delete the image in the mobiel storage
            },
            
          )
        ],
      );
    
    }, );
  }

  @override
@override
void dispose() {
  super.dispose();
  _descriptionController.dispose();
}

  Widget build(BuildContext context) {

    final User user =  Provider.of<UserProvider>(context).getUser;
    return _file== null? Center(
      child: IconButton(
        icon: const Icon(Icons.upload),
        onPressed: () =>  _selectImage(context)
      ),
    ):

     Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        leading: Padding(
          padding:
              const EdgeInsets.only(left: 8.0), // Adjust this value as needed
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        title: const Text('Post to'),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed:PostImage,
            child: const Text(
              'Post',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.photoUrl),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: TextField(
                  controller:_descriptionController ,
                  decoration: const InputDecoration(
                      hintText: ' Write a caption....',
                      border: InputBorder.none),
                  maxLines: 8,
                ),
              ),
              SizedBox(
                height: 45,
                width: 45,
                child: AspectRatio(
                  aspectRatio: 487 / 451,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: MemoryImage(_file!),
                            fit: BoxFit.fill,
                            alignment: FractionalOffset.topCenter)),
                  ),
                ),
              ),
                const Divider()
            ],
          )
        ],
      ),
    );
  }
}
