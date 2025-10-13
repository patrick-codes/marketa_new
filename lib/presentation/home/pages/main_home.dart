import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/presentation/favorite/pages/favorite_page.dart';
import 'package:marketa_new/presentation/order/pages/order_page.dart';
import 'package:marketa_new/presentation/profile/pages/profile_page.dart';
import 'package:marketa_new/presentation/settings/pages/settings.dart';
import '../../../helpers/color/colors.dart';
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
    OrderPage(),
    FavoritePage(),
    ProfilePage(),
    SettingsPage(),
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
          activeColor: primaryColor,
          iconSize: 25,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          duration: const Duration(milliseconds: 300),
          color: Colors.black45,
          curve: Curves.bounceIn,
          style: GnavStyle.oldSchool,
          tabBorderRadius: 100.0,
          tabMargin: EdgeInsets.all(5),
          textSize: 8,
          gap: 0,
          tabs: const [
            GButton(
              icon: MingCute.home_6_line,
              text: 'Home',
            ),
            GButton(
              icon: MingCute.list_ordered_line,
              text: 'Orders',
            ),
            GButton(
              icon: MingCute.heart_line,
              text: 'Favorite',
            ),
            GButton(
              icon: MingCute.user_1_line,
              text: 'Profile',
            ),
            GButton(
              icon: MingCute.settings_1_line,
              text: 'Settings',
            ),
          ],
        ),
        body: pages.elementAt(_selectedIndex));
  }
}
