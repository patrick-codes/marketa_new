import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../helpers/color/colors.dart';
import '../../../helpers/images/image_helpers.dart';
import '../../../helpers/text style/text_style.dart';
import '../../../helpers/widgets/custom_appbar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<IconData> icons = <IconData>[
    MingCute.shopping_cart_1_line,
    MingCute.chat_2_line,
    MingCute.sale_line,
    MingCute.package_line,
  ];

  List<String> paymentMethods = <String>[
    'Purchase Completed!',
    'Jeremy Liked Your Product',
    'Flash Sale!',
    'Package Sent',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Notifications',
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              icon: Icon(
                MingCute.settings_5_line,
                size: 22,
                color: iconGrey,
              ),
            ),
            SizedBox(width: 14),
          ],
        ),
      ),
      backgroundColor: secondaryBg,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headingTextSemiBold(context, 'Recent'),
                SizedBox(height: 15),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: ListView.builder(
                    itemCount: icons.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 87,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(12),
                        margin: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: outlineGrey),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(65),
                                    color: primaryContainerShade,
                                  ),
                                  child: Center(
                                    child: Icon(icons[index]),
                                  ),
                                ),
                                SizedBox(width: 8),
                                SizedBox(
                                  height: 60,
                                  width: 235,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          headingCustomSemiBold(
                                              context,
                                              paymentMethods[index],
                                              FontWeight.w700),
                                          SizedBox(height: 3),
                                          subheadingText(
                                              context, '******** 1234'),
                                        ],
                                      ),
                                      subheadingText(context, '2 min ago'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
