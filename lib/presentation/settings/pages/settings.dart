import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../helpers/color/colors.dart';
import '../../../helpers/text style/text_style.dart';
import '../../../helpers/widgets/custom_appbar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<IconData> icons = <IconData>[
    MingCute.moon_line,
    MingCute.lock_line,
    MingCute.notification_line,
    MingCute.user_security_line,
    MingCute.earth_2_line,
  ];
  List<IconData> prefIcons = <IconData>[
    MingCute.shield_line,
    MingCute.chat_2_line,
    MingCute.exit_line,
  ];

  List<String> general = <String>[
    'Themes',
    'Change Password',
    'Notifications',
    'Security',
    'Language',
  ];
  List<String> preferences = <String>[
    'Legal and Policies',
    'Help & Support',
    'Logout',
  ];

  List<String> generalRoutes = <String>[
    'themes',
    'passwordsettings',
    'notificationsettings',
    'security',
    'languages',
  ];
  List<String> prefRoutes = <String>[
    'legal',
    'support',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          isLeading: false,
          title: 'Settings',
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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headingTextSemiBold(context, 'General'),
                SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.43,
                  child: ListView.builder(
                    itemCount: icons.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: index == 4 ? 65 : 50,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: primaryContainerShade),
                        ),
                        child: ListTile(
                          onTap: () {
                            debugPrint('${generalRoutes[index]} Clicked!');
                            Navigator.pushNamed(
                                context, '/${generalRoutes[index]}');
                          },
                          minLeadingWidth: 2,
                          horizontalTitleGap: 8,
                          minTileHeight: 5,
                          dense: true,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                          leading: SizedBox(
                            height: 40,
                            width: 40,
                            child: Center(
                              child: Icon(
                                icons[index],
                                size: 22,
                              ),
                            ),
                          ),
                          title: Text(
                            general[index],
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          subtitle: index == 4
                              ? Row(
                                  children: [
                                    Text(
                                      'English',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: subtitleColor,
                                          ),
                                    ),
                                  ],
                                )
                              : SizedBox.shrink(),
                          trailing: Icon(
                            MingCute.right_line,
                            color: iconGrey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 5),
                headingTextSemiBold(context, 'Preferences'),
                SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: ListView.builder(
                    itemCount: prefIcons.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: primaryContainerShade),
                        ),
                        child: ListTile(
                          onTap: () {
                            // Navigator.pushNamed(context, '/mainshop');
                          },
                          minLeadingWidth: 2,
                          horizontalTitleGap: 8,
                          minTileHeight: 5,
                          dense: true,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                          leading: SizedBox(
                            height: 40,
                            width: 40,
                            child: Center(
                              child: Icon(
                                prefIcons[index],
                                color: index == 2 ? Colors.red : blackColor,
                                size: 22,
                              ),
                            ),
                          ),
                          title: Text(
                            preferences[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  fontSize: 14,
                                  color: index == 2 ? Colors.red : blackColor,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          trailing: index == 2
                              ? SizedBox.shrink()
                              : Icon(
                                  MingCute.right_line,
                                  color: iconGrey,
                                ),
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
