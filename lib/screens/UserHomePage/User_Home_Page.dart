// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ortho/components/NavBar.dart';
import 'package:ortho/screens/Home/Home_Page.dart';
import 'package:ortho/screens/Profile/Profile_Page.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  late PageController _homeController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _homeController = PageController(initialPage: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _homeController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index; // Update _selectedIndex when page changes
          });
        },
        children: [
          HomePage(),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: navBar(
        context: context,
        homeController: _homeController,
        selectedIndex: _selectedIndex,
        onIndexChanged: (index) {
          setState(() {
            _selectedIndex = index; // Update _selectedIndex when page changes
          });
        },
      ),
    );
  }
}
