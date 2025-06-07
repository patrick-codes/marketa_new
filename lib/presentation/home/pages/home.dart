import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/color/colors.dart';
import 'package:marketa_new/helpers/text%20style/text_style.dart';
import 'package:marketa_new/presentation/category/pages/category.dart';
import '../../../helpers/images/image_helpers.dart';
import '../components/home_component.dart';

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
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/search');
                  },
                  icon: Icon(
                    MingCute.search_line,
                    size: 22,
                    color: iconGrey,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/notification');
                  },
                  icon: Badge(
                    child: Icon(
                      MingCute.notification_line,
                      size: 22,
                      color: iconGrey,
                    ),
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/chatbot');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/bot.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
              title: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(onboardingImg3),
                  ),
                  SizedBox(width: 5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appbarText(context, 'Hi, Jonathan'),
                      appbarSubText(context, 'Lets go shopping', 11),
                    ],
                  )
                ],
              ),
              bottom: TabBar(
                controller: tabController,
                dividerColor: outlineGrey,
                unselectedLabelColor: subtitleColor,
                unselectedLabelStyle:
                    Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: primarySucessShade,
                          fontWeight: FontWeight.w400,
                        ),
                labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: primaryColor2,
                      fontWeight: FontWeight.w400,
                    ),
                indicatorColor: primaryColor,
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    child: Text("Home"),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        Text("Category"),
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
              child: HomeComponent(),
            ),
            SingleChildScrollView(
              child: CategoryScreen(),
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
