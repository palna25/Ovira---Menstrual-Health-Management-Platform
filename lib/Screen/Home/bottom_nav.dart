import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ovira1/Screen/Home/FavScreen/fav_screen.dart';
import 'package:ovira1/Screen/Home/HomeScreen/home_screen.dart';
import 'package:ovira1/Screen/Home/SettingScreen/setting_screen.dart';

import '../Utils/colors.dart';

class BottomNav extends StatefulWidget{
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List Screens = [
    //PeriodTrackingCalendar(),
    const HomeScreen(),
    const FavScreen(),
    const SettingScreen(),
  ];
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: backgroundColor4,
        color: primaryColor,
        animationDuration: const Duration(milliseconds: 300),
        index: _selectedIndex,
        items: const [
          Icon(Icons.home),
          Icon(Icons.favorite),
          Icon(Icons.settings)
        ],
        onTap: (index){
          setState(() {
            _selectedIndex=index;
          });
        },
      ),
      body: Screens[_selectedIndex],
    );
  }
    }