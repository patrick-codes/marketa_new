import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/color/colors.dart';
import 'package:marketa_new/helpers/text%20style/text_style.dart';
import '../../../helpers/widgets/custom_appbar.dart';

class ShopDetailsPage extends StatelessWidget {
  const ShopDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              title: 'Detail Product',
              actions: [
                Icon(MingCute.shopping_bag_3_line),
                SizedBox(width: 12),
              ],
            ),
          ),
          backgroundColor: secondaryBg,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.40,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/img6.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: ListTile(
                            minLeadingWidth: 2,
                            horizontalTitleGap: 8,
                            minTileHeight: 5,
                            minVerticalPadding: 5,
                            dense: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 5),
                            title: Row(
                              children: [
                                headingTextMedium(
                                    context, 'Box Bag Linar 1883'),
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                Icon(
                                  MingCute.star_fill,
                                  size: 20,
                                  color: const Color.fromRGBO(248, 206, 21, 1),
                                ),
                                SizedBox(width: 5),
                                subheadingSmallBoldText(context, '4.8', 13),
                                SizedBox(width: 5),
                                subheadingText(context, ' (320 Review)'),
                              ],
                            ),
                            trailing: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: secondaryColor3,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Center(
                                child:
                                    Icon(MingCute.heart_line, color: iconGrey),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        appbarSubText(
                          context,
                          'Elevate your daily style with our Classic Everyday Tote Bag — the perfect blend of fashion, function, and durability. Crafted from premium canvas.',
                          13,
                        ),
                        SizedBox(height: 22),
                        ListTile(
                          onTap: () {
                            // Navigator.pushNamed(context, '/mainshop');
                          },
                          minLeadingWidth: 2,
                          horizontalTitleGap: 5,
                          minTileHeight: 5,
                          dense: true,
                          contentPadding: EdgeInsets.symmetric(),
                          leading: CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  Image.asset('assets/images/img.jpg').image),
                          title: Row(
                            children: [
                              Text(
                                'Upbox Bag',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
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
                            children: [
                              Text(
                                '104 Products',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: subtitleColor,
                                    ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                '1.2k Followers',
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
                          ),
                          trailing: Container(
                            height: 35,
                            width: 85,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                'Follow',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 12,
                                      color: whiteColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Divider(color: outlineGrey),
                        SizedBox(height: 22),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            headingTextSemiBold(context, 'Choose amount:'),
                            Container(
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                color: secondaryColor3,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      ' -',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Icon(Icons.add),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
