import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/color/colors.dart';

import 'components/filter_screen.dart';

class MainSearchPage extends StatefulWidget {
  const MainSearchPage({super.key});

  @override
  State<MainSearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<MainSearchPage> {
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _passwordNode2 = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _focusNode2.addListener(_onFocusChange);
    _focusNode3.addListener(_onFocusChange);
    _focusNode4.addListener(_onFocusChange);
    _passwordNode.addListener(_onFocusChange);
    _passwordNode2.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _passwordNode.dispose();
    _passwordNode2.dispose();
    super.dispose();
  }

  List<String> title = <String>[
    "All",
    "Latest",
    "Most Popular",
    "Cheapest",
    "Trift",
    "Hot Sale",
  ];
  List<String> title2 = <String>[
    "Meriza Kiles",
    "The Mirac Jiz",
    "Meriza Kiles",
    "The Mirac Jiz",
    "Meriza Kiles",
    "The Mirac Jiz",
  ];
  List<String> imgs = <String>[
    "assets/images/img3.jpg",
    "assets/images/img.jpg",
    "assets/images/img.jpg",
    "assets/images/img3.jpg",
    "assets/images/img3.jpg",
    "assets/images/img.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBg,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: secondaryBg,
        surfaceTintColor: secondaryBg,
        leading: Icon(
          Icons.arrow_back_ios_rounded,
          size: 22,
        ),
        title: Form(
          key: formKey,
          child: TextFormField(
            // controller: SignupController.email,
            focusNode: _focusNode4,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter something';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Search....',
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: subtitleColor,
                    fontSize: 12,
                  ),
              prefixIcon: Icon(
                MingCute.search_line,
                size: 23,
                color: _focusNode4.hasFocus ? blackColor : subtitleColor,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    scrollBottomSheet(context);
                  },
                  icon: Icon(MingCute.settings_2_line,
                      size: 20, color: blackColor)),
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
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 35,
                  child: ListView.builder(
                    itemCount: title.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 25,
                        width: index == 0 ? 40 : 80,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            color:
                                index == 0 ? Colors.transparent : outlineGrey,
                          ),
                          color: index == 0 ? primaryColor : whiteColor,
                        ),
                        child: Center(
                          child: Text(
                            title[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color:
                                      index == 0 ? whiteColor : subtitleColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      );
                      // SizedBox(width: 12),
                      // Container(
                      //   height: 25,
                      //   width: 60,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(7),
                      //     border: Border.all(
                      //       color: outlineGrey,
                      //     ),
                      //   ),
                      //   child: Center(
                      //     child: Text(
                      //       'Latest',
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .bodySmall!
                      //           .copyWith(
                      //             color: subtitleColor,
                      //             fontSize: 10,
                      //             fontWeight: FontWeight.w600,
                      //           ),
                      //     ),
                      //   ),
                      // ),
                    },
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/mainshop');
                    },
                    minLeadingWidth: 2,
                    horizontalTitleGap: 8,
                    minTileHeight: 5,
                    dense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 5),
                    leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            Image.asset('assets/images/img.jpg').image),
                    title: Row(
                      children: [
                        Text(
                          'Upbox Bag',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.verified,
                          color: primaryColor,
                          size: 13,
                        ),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '104 Products',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: subtitleColor,
                                  ),
                        ),
                        Text(
                          '1.2k Followers',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: subtitleColor,
                                  ),
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: subtitleColor,
                      size: 13,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Divider(color: outlineGrey),
                SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.6,
                    mainAxisExtent: 190,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(imgs[index]).image,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 5,
                                right: 5,
                                child: Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.shade500,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      MingCute.heart_line,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              title2[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: blackColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                  ),
                            ),
                            SizedBox(height: 3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Lisa Robber',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                        color: Colors.black45,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(height: 3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'GHC 195.00',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: blackColor,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> scrollBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isDismissible: true,
      //  isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.9,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder: (BuildContext context, ScrollController scrollController) {
            return FilterScreen();
          },
        );
      },
    );
  }
}
