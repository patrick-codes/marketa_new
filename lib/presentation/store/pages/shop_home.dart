import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../helpers/color/colors.dart';
import '../../home/components/home_slide_imgs.dart';

class MainShopHome extends StatefulWidget {
  const MainShopHome({super.key});

  @override
  State<MainShopHome> createState() => _MainShopHomeState();
}

class _MainShopHomeState extends State<MainShopHome>
    with TickerProviderStateMixin {
  late TabController tabController;
  static final _controller = PageController();

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  List<String> title = <String>[
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
        backgroundColor: secondaryBg,
        shadowColor: outlineGrey,
        elevation: 0.2,
        centerTitle: true,
        title: Text(
          'Store',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
        ),
        actions: [
          Icon(
            MingCute.shopping_bag_3_line,
          ),
          SizedBox(width: 13),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        shape: CircleBorder(),
        child: Icon(
          MingCute.chat_1_line,
          color: whiteColor,
          size: 25,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ListTile(
                onTap: () {
                  // Navigator.pushNamed(context, '/mainshop');
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
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: subtitleColor,
                          ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '1.2k Followers',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 12,
                            color: whiteColor,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TabBar(
              //isScrollable: true,
              controller: tabController,
              dividerColor: outlineGrey,
              unselectedLabelColor: subtitleColor,
              unselectedLabelStyle:
                  Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: primarySucessShade,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
              labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: primaryColor2,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
              indicatorColor: primaryColor,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Text("Main Page"),
                ),
                Tab(
                  child: Text("All Products"),
                ),
                Tab(
                  child: Text("Best Selling"),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                dragStartBehavior: DragStartBehavior.start,
                controller: tabController,
                children: [
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 5),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 160,
                              child: Column(
                                children: [
                                  Container(
                                    height: 130,
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                                'assets/images/banner2.png')
                                            .image,
                                      ),
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  'Popular Products',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: blackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
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
                                                borderRadius:
                                                    BorderRadius.circular(20),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          textAlign: TextAlign.center,
                                          title[index],
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 5),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 160,
                              child: Column(
                                children: [
                                  Container(
                                    height: 130,
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                                'assets/images/banner2.png')
                                            .image,
                                      ),
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  'New Arrivals',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: blackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  'See All',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: primaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.5,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
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
                                                borderRadius:
                                                    BorderRadius.circular(20),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          textAlign: TextAlign.center,
                                          title[index],
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 5),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 160,
                              child: Column(
                                children: [
                                  Container(
                                    height: 130,
                                    width: MediaQuery.of(context).size.width,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                                'assets/images/banner2.png')
                                            .image,
                                      ),
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  'New Arrivals',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: blackColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  'See All',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: primaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11.5,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
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
                                                borderRadius:
                                                    BorderRadius.circular(20),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          textAlign: TextAlign.center,
                                          title[index],
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
