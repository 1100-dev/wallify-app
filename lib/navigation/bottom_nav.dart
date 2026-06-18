
import 'package:flutter/material.dart';

import '../screens/home/home_page.dart';
import '../screens/home/search_page.dart';
import '../screens/favorites/favorites_page.dart';
import '../screens/profile/profile_page.dart';
import '../screens/color_finder/color_finder_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    SearchPage(),
    FavoritesPage(),
    ProfilePage(),
  ];

  void onFabPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const ColorFinderPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //--------------------------------
      // GLOBAL APP BAR
      //--------------------------------


      //--------------------------------
      // BODY
      //--------------------------------
      body: pages[currentIndex],

      //--------------------------------
      // COLOR FINDER FAB
      //--------------------------------
      floatingActionButton: FloatingActionButton(
        onPressed: onFabPressed,
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.palette),
      ),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,

      //--------------------------------
      // BOTTOM NAV
      //--------------------------------
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
