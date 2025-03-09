import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp/providers/app_provider.dart';
import 'package:movieapp/screens/about_me.dart';
import 'package:movieapp/screens/explore.dart';
import 'package:movieapp/screens/home.dart';
import 'package:movieapp/screens/favorite.dart';
import 'package:provider/provider.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final List _pages = [
    const Home(),
    const Explore(),
    const Favorite(),
    const AboutMe(),
  ];

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: _pages[appProvider.tab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: appProvider.tab,
        onTap: (index) {
          HapticFeedback.lightImpact();
          appProvider.tab = index;
        },
        selectedItemColor: Colors.black,
        selectedFontSize: 12,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "About me",
          ),
        ],
      ),
    );
  }
}
