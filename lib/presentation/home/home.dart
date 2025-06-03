import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/color/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'components/home_slide_imgs.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: secondaryColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
            decoration: const BoxDecoration(),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: whiteColor,
              shadowColor: outlineGrey,
              elevation: 0.2,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/search');
                  },
                  icon: Icon(
                    MingCute.search_line,
                    size: 22,
                    color: blackColor,
                  ),
                ),
                SizedBox(width: 18),
                Badge(
                  child: Icon(
                    MingCute.notification_line,
                    size: 22,
                    color: blackColor,
                  ),
                ),
                SizedBox(width: 14),
              ],
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/img3.jpg'),
                  ),
                  SizedBox(width: 5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Jonathan',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                      ),
                      Text(
                        'Lets go shopping!',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: subtitleColor,
                              fontSize: 11,
                            ),
                      ),
                    ],
                  )
                ],
              ),
              bottom: TabBar(
                //isScrollable: true,
                controller: tabController,
                labelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                //unselectedLabelColor: Colors.white,
                dividerColor: outlineGrey,
                unselectedLabelStyle: const TextStyle(
                  color: subtitleColor,
                ),
                indicatorColor: primaryColor,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.white,
                tabs: [
                  Tab(
                    child: Text(
                      "Home",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        Text(
                          "Category",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: blackColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          dragStartBehavior: DragStartBehavior.start,
          controller: tabController,
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TopBannerSection(),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            'New Arrivals',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: blackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            'See All',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11.5,
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
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
                                crossAxisAlignment: CrossAxisAlignment.center,
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
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                //height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 130,
                        width: MediaQuery.of(context).size.width,
                        // padding: const EdgeInsets.symmetric(
                        //   horizontal: 20,
                        //   vertical: 20,
                        // ),
                        margin: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset('assets/images/img.jpg').image,
                          ),
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                      'New Arrivals',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: whiteColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                          ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                      '208 Products',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Colors.grey.shade400,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 130,
                        width: MediaQuery.of(context).size.width,
                        // padding: const EdgeInsets.symmetric(
                        //   horizontal: 20,
                        //   vertical: 20,
                        // ),
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset('assets/images/img.jpg').image,
                          ),
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                      'Clothes',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: whiteColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                          ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                      '358 Products',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Colors.grey.shade400,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 130,
                        width: MediaQuery.of(context).size.width,
                        // padding: const EdgeInsets.symmetric(
                        //   horizontal: 20,
                        //   vertical: 20,
                        // ),
                        margin: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset('assets/images/img.jpg').image,
                          ),
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                      'Shoes',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: whiteColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                          ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                      '160 Products',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Colors.grey.shade400,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 130,
                        width: MediaQuery.of(context).size.width,
                        // padding: const EdgeInsets.symmetric(
                        //   horizontal: 20,
                        //   vertical: 20,
                        // ),
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset('assets/images/img.jpg').image,
                          ),
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                      'Electronics',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: whiteColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                          ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                      '508 Products',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Colors.grey.shade400,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 130,
                        width: MediaQuery.of(context).size.width,
                        // padding: const EdgeInsets.symmetric(
                        //   horizontal: 20,
                        //   vertical: 20,
                        // ),
                        margin: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset('assets/images/img.jpg').image,
                          ),
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                      'Bags',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: whiteColor,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                          ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      overflow: TextOverflow.visible,
                                      '230 Products',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Colors.grey.shade400,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildShopCard(
  Color color,
  BuildContext context,
  String title,
  String location,
  String imgs,
  double horiMargin,
  double vertMargin,
  Color textColor,
  Color subtextColor,
  Color brColor,
) {
  return Column(
    children: [
      Container(
        height: 130,
        width: MediaQuery.of(context).size.width,
        // padding: const EdgeInsets.symmetric(horizontal: 10),
        // margin: const EdgeInsets.symmetric(horizontal: 5),
        margin: EdgeInsets.symmetric(
          horizontal: horiMargin,
          vertical: vertMargin,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1.5,
            color: brColor,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 1,
              color: secondaryColor2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
