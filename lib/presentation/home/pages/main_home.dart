import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
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
        bottomNavigationBar: FlashyTabBar(
          selectedIndex: _selectedIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
          }),
          items: [
            FlashyTabBarItem(
              icon: Icon(
                MingCute.home_1_line,
              ),
              title: Text('Home'),
            ),
            FlashyTabBarItem(
              icon: Icon(MingCute.bike_line),
              title: Text('Orders'),
            ),
            FlashyTabBarItem(
              icon: Icon(MingCute.heart_line),
              title: Text('Favorite'),
            ),
            FlashyTabBarItem(
              icon: Icon(MingCute.user_1_fill),
              title: Text('Profile'),
            ),
            FlashyTabBarItem(
              icon: Icon(MingCute.settings_1_line),
              title: Text('Settings'),
            ),
          ],
        ),
        body: pages.elementAt(_selectedIndex));
  }
}
