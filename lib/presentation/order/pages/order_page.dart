import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/presentation/order/components/myorder_component.dart';
import 'package:marketa_new/presentation/order/components/order_history_component.dart';
import '../../../helpers/color/colors.dart';
import '../../../helpers/text style/text_style.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
            decoration: const BoxDecoration(),
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: whiteColor,
              scrolledUnderElevation: 0.0,
              elevation: 0.2,
              centerTitle: true,
              title: appbarText(context, 'My Order'),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  icon: Badge(
                    child: Icon(
                      MingCute.shopping_bag_1_line,
                      size: 22,
                      color: iconGrey,
                    ),
                  ),
                ),
                SizedBox(width: 14),
              ],
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
                    child: Text("My Order"),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        Text("History"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: secondaryBg,
        body: TabBarView(
          dragStartBehavior: DragStartBehavior.start,
          controller: tabController,
          children: [
            SingleChildScrollView(
              child: MyorderComponent(),
            ),
            SingleChildScrollView(
              child: OrderHistoryComponent(),
            ),
          ],
        ),
      ),
    );
  }
}
