import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/text%20style/text_style.dart';
import '../../../helpers/color/colors.dart';
import '../../../helpers/widgets/custom_appbar.dart';
import '../../../helpers/widgets/custom_button.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Payment',
        ),
      ),
      backgroundColor: secondaryBg,
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        height: 120,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: primaryContainerShade),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                subheadingText(context, 'Total Amount'),
                headingCustomSemiBold(
                  context,
                  ' GHC 99.00',
                  FontWeight.w600,
                ),
              ],
            ),
            SizedBox(height: 8),
            CustomButton(
                text: 'Checkout Now',
                onpressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
                color: primaryColor),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  headingCustomSemiBold(
                    context,
                    'Address',
                    FontWeight.bold,
                  ),
                  labelseeAllText(context, 'Edit', () {}),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 80,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset('assets/images/img.jpg').image,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                    height: 80,
                    width: 190,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        headingCustomSemiBold(
                            context, 'House', FontWeight.w500),
                        SizedBox(height: 5),
                        subheadingText(
                            context,
                            '5482 Lafa Road Weija-Gbawe, Acrra Ghana',
                            TextAlign.start),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Divider(color: outlineGrey),
              SizedBox(height: 20),
              headingCustomSemiBold(context, 'Products (3)'),
              SizedBox(height: 15),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 65,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset('assets/images/img.jpg')
                                      .image,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            SizedBox(
                              height: 65,
                              width: 195,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  headingCustomSemiBold(
                                      context,
                                      'Big Bag Limited Edition',
                                      FontWeight.w500),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          subheadingText(context, 'Color:'),
                                          SizedBox(width: 5),
                                          subheadingSmallBoldText(
                                              context, 'Brown', 10),
                                        ],
                                      ),
                                      headingTextMedium(
                                        context,
                                        'GHC 27.00',
                                        FontWeight.w600,
                                        12,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
              headingCustomSemiBold(context, 'Payment Method'),
              SizedBox(height: 15),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8),
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
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(65),
                            color: primaryContainerShade,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset('assets/images/at.png').image,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          height: 60,
                          width: 240,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              headingCustomSemiBold(
                                  context, 'AirtelTigo Money', FontWeight.w500),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  subheadingText(context, '******** 1234'),
                                  Icon(
                                    MingCute.right_line,
                                    size: 25,
                                    color: iconGrey,
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
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
