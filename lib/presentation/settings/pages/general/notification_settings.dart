import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/widgets/custom_appbar.dart';

import '../../../../helpers/color/colors.dart';

class NotifSettingsPage extends StatelessWidget {
  const NotifSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          isLeading: false,
          title: 'Notification Settings',
          actions: [
            IconButton(
              onPressed: () {
                //Navigator.pushNamed(context, '/settings');
              },
              icon: Icon(
                MingCute.more_2_fill,
                size: 22,
                color: blackColor,
              ),
            ),
            SizedBox(width: 14),
          ],
        ),
      ),
      backgroundColor: secondaryBg,
    );
  }
}
