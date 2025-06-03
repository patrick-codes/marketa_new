import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../helpers/color/colors.dart';
import 'home.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({
    super.key,
  });

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  String? usernew;
  int _selectedIndex = 0;

  List<Widget> pages = [
    MyHomePage(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  int initPage = 0;
  onPageClick(index) {
    setState(() {
      initPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: secondaryColor2,
        bottomNavigationBar: GNav(
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          backgroundColor: secondaryColor,
          hoverColor: Colors.orange,
          activeColor: primaryColor,
          iconSize: 25,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          duration: const Duration(milliseconds: 300),
          color: subtitleColor,
          curve: Curves.bounceIn,
          style: GnavStyle.oldSchool,
          tabBorderRadius: 100.0,
          tabMargin: EdgeInsets.all(2),
          textSize: 10,
          gap: 0,
          tabs: [
            GButton(
              icon: _selectedIndex == 0
                  ? MingCute.home_1_fill
                  : MingCute.home_1_line,
              text: 'Home',
            ),
            GButton(
              icon:
                  _selectedIndex == 1 ? MingCute.bike_fill : MingCute.bike_line,
              text: 'Orders',
            ),
            GButton(
              icon: _selectedIndex == 2
                  ? MingCute.heart_fill
                  : MingCute.heart_line,
              text: 'Favorite',
            ),
            GButton(
              icon: _selectedIndex == 3
                  ? MingCute.list_check_3_fill
                  : MingCute.list_check_3_line,
              text: 'Bookings',
            ),
            GButton(
              icon: _selectedIndex == 4
                  ? MingCute.user_1_fill
                  : MingCute.user_1_line,
              text: 'Profile',
            ),
          ],
        ),
        body: pages.elementAt(_selectedIndex));
  }
}
