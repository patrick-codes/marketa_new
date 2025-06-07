import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/widgets/order_progress.dart';
import '../../../helpers/color/colors.dart';
import '../../../helpers/text style/text_style.dart';
import '../../../helpers/widgets/custom_button.dart';
import '../../checkout/components/checkout_component.dart';

class OrderTrackingPage extends StatelessWidget {
  const OrderTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: secondaryBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        elevation: 0.2,
        centerTitle: true,
        //forceMaterialTransparency: true,
        title: appbarText(context, 'Order Tracking'),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(15),
        height: 450,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: secondaryBg,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          border: Border.all(color: primaryContainerShade),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/img.jpg',
                            ).image,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        height: 60,
                        width: 235,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                headingCustomSemiBold(
                                    context, 'Alexander Jr', FontWeight.w700),
                                SizedBox(height: 3),
                                subheadingText(context, 'Courier'),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: primaryContainerShade,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      MingCute.chat_3_line,
                                      color: iconGrey,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: primaryContainerShade,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Icon(
                                      MingCute.phone_line,
                                      color: iconGrey,
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
                ],
              ),
            ),
            SizedBox(height: 12),
            OrderProgressWidget(),
            SizedBox(height: 25),
            CustomButton(
              text: 'Mark as Done',
              onpressed: () {},
              color: whiteColor,
              outlineColor: primaryColor,
              textColor: primaryColor,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              "assets/images/map.jpeg",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
