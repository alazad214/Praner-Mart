import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pranermart/app/faviorite/faviorite_screen.dart';
import 'package:pranermart/app/profile/views/profile_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../cart/card_screen.dart';
import '../home/views/home_screen.dart';

class NavScreen extends StatefulWidget {
  NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  var _currentIndex = 0;

  final _pages = [
    HomeScreen(),
    CartScreen(),
    FavioriteScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
              icon: const Icon(Iconsax.home),
              title: const Text("Home"),
              selectedColor: Colors.blueGrey,
              activeIcon: const Icon(
                Iconsax.home5,
                color: Colors.blue,
              )),

          /// Likes
          SalomonBottomBarItem(
              icon: const Icon(Iconsax.shopping_bag),
              title: const Text("Cart"),
              selectedColor: Colors.pink,
              activeIcon: const Icon(
                Iconsax.shopping_bag,
                color: Colors.red,
              )),

          /// Search
          SalomonBottomBarItem(
              icon: const Icon(Iconsax.heart),
              title: const Text("Favorite"),
              selectedColor: Colors.orange,
              activeIcon: const Icon(
                Iconsax.heart5,
                color: Colors.red,
              )),

          /// Profile
          SalomonBottomBarItem(
              icon: Icon(Iconsax.setting),
              title: const Text("Settings"),
              selectedColor: Colors.teal,
              activeIcon: Icon(
                Iconsax.setting,
                color: Colors.blue,
              )),
        ],
      ),
    );
  }
}
