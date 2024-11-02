import 'package:flutter/material.dart';
import 'package:instagram/utils/colors.dart';
class WebScreenLayout extends StatefulWidget {

  const WebScreenLayout({super.key});

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
   int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }
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