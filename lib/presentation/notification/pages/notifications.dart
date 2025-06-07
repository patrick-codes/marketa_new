import 'package:flutter/material.dart';
import '../../../helpers/color/colors.dart';
import '../../../helpers/widgets/custom_appbar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Notification',
        ),
      ),
      backgroundColor: secondaryBg,
    );
  }
}
