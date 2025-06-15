import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/color/colors.dart';
import 'package:marketa_new/helpers/text%20style/text_style.dart';
import 'package:marketa_new/helpers/widgets/custom_bottomnav_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../helpers/images/image_helpers.dart';
import '../../../helpers/widgets/custom_appbar.dart';

class ShopDetailsPage extends StatelessWidget {
  ShopDetailsPage({super.key});

  static final _controller = PageController();
  final List<String> imgs = <String>[
    itemImg1,
    itemImg2,
    itemImg3,
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              title: 'Product Details',
              actions: [
                Icon(MingCute.shopping_bag_3_line),
                SizedBox(width: 12),
              ],
            ),
          ),
          backgroundColor: secondaryBg,
          bottomNavigationBar: Container(
            padding: EdgeInsets.all(10),
            height: 75,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(color: primaryContainerShade),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appbarSubText(context, 'Price', 15),
                    headingTextMedium(context, 'GHC 45.25'),
                  ],
                ),
                CustomNavButton(
                    text: 'Add to Cart',
                    onpressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    color: primaryColor),
              ],
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.35,
                        child: PageView.builder(
                          controller: _controller,
                          itemCount: imgs.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.35,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(imgs[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        child: SizedBox(
                          height: 30,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SmoothPageIndicator(
                                controller: _controller,
                                count: 3,
                                effect: JumpingDotEffect(
                                  paintStyle: PaintingStyle.stroke,
                                  activeDotColor: primaryColor,
                                  dotHeight: 8,
                                  dotWidth: 8,
                                  spacing: 8,
                                ),
                              ),
                            ],
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
                                SizedBox(width: 10),
                                Container(
                                  height: 18,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: outlineGrey,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: subheadingText(
                                      context,
                                      'ACTIVE',
                                      TextAlign.center,
                                      10,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                subheadingText(
                                  context,
                                  'SLIGHTLY USED',
                                  TextAlign.center,
                                  9,
                                ),
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
                                'Peter Boateng',
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
                                '104 Products Listed',
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
                            height: 33,
                            width: 85,
                            decoration: BoxDecoration(
                              border: Border.all(color: outlineGrey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                'View shop',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 10.5,
                                      color: primaryColor,
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
                            headingTextSemiBold(context, 'Quantity:'),
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
                                    SizedBox(width: 14),
                                    Text(
                                      '1',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(width: 14),
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
