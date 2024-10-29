import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/utils/colors.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('this is mobile'),
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            backgroundColor: mobileBackgroundColor,
            icon: Icon(
              Icons.home,
              color: _page == 0 ? primaryColor : secondaryColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,color: _page == 1? primaryColor : secondaryColor,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle,color: _page == 3 ? primaryColor : secondaryColor,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,color: _page == 4 ? primaryColor : secondaryColor,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: _page == 5 ? primaryColor : secondaryColor,),
            label: '',
          ),
        ],
        backgroundColor: primaryColor,
      ),
    );
  }
}

class _page {}
