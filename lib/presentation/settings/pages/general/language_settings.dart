import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../helpers/color/colors.dart';
import '../../../../helpers/text style/text_style.dart';
import '../../../../helpers/widgets/custom_appbar.dart';

class LanguageSettings extends StatefulWidget {
  const LanguageSettings({super.key});

  @override
  State<LanguageSettings> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<LanguageSettings> {
  final FocusNode _focusNode4 = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _focusNode4.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode4.dispose();
    super.dispose();
  }

  String selectedLanguage = '';
  int? selectedIndex = 0;
  List<String> language = <String>[
    'English',
    'Bahasa Indonesia',
    'Chinese',
    'Deutsch',
    'Spanish',
  ];

  List<String> imgs = <String>[
    '45-451954_uk-round-flag-png.png',
    'flag-round-250.png',
    '98470_flag_512x512.png',
    '9-97176_german-flag-transparent-german-flag-circle-png.png',
    'R.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Language',
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
                Form(
                  key: formKey,
                  child: TextFormField(
                    // controller: SignupController.email,
                    focusNode: _focusNode4,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Search Language';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Search language',
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: subtitleColor,
                                fontSize: 12,
                              ),
                      prefixIcon: Icon(
                        MingCute.search_line,
                        size: 23,
                        color:
                            _focusNode4.hasFocus ? blackColor : subtitleColor,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryBg),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      filled: true,
                      isDense: true,
                      fillColor: whiteColor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 1.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: subtitleColor),
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.43,
                  child: ListView.builder(
                    itemCount: language.length,
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
                            setState(() {
                              selectedIndex = index;
                              selectedLanguage = language[index];
                              print('$selectedLanguage clicked!');
                            });
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
                              child:
                                  Image.asset('assets/images/${imgs[index]}')),
                          title: Text(
                            language[index],
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          trailing: selectedIndex == index
                              ? Icon(
                                  Icons.done,
                                  color: primaryColor,
                                  size: 15,
                                )
                              : SizedBox.shrink(),
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
