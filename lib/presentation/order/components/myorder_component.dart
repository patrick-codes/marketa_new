import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/text%20style/text_style.dart';
import '../../../helpers/color/colors.dart';

class MyorderComponent extends StatefulWidget {
  const MyorderComponent({super.key});

  @override
  State<MyorderComponent> createState() => _HomeComponentState();
}

class _HomeComponentState extends State<MyorderComponent> {
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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: ListView.builder(
          itemCount: imgs.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 170,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: outlineGrey),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryContainerShade,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              imgs[index],
                            ).image,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        height: 80,
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                headingCustomSemiBold(
                                    context, title[index], FontWeight.w700),
                                SizedBox(height: 3),
                                Row(
                                  children: [
                                    subheadingText(context, 'Color:'),
                                    SizedBox(width: 5),
                                    subheadingSmallBoldText(
                                      context,
                                      'Brown',
                                      11.5,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    subheadingText(context, 'Qty:'),
                                    SizedBox(width: 5),
                                    subheadingSmallBoldText(
                                      context,
                                      '2',
                                      11.5,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 80,
                              width: 100,
                              child: Column(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 54, 145, 152),
                                      ),
                                    ),
                                    child: Center(
                                      child: subheadingSmallBoldText(
                                        context,
                                        'In Progress',
                                        10,
                                        const Color.fromARGB(255, 54, 145, 152),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  labelTextRegular(
                                    context,
                                    'GHC 24.00',
                                    blackColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 35,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                            color: outlineGrey,
                          ),
                        ),
                        child: Center(
                          child: subheadingSmallBoldText(
                            context,
                            'Detail',
                            11,
                          ),
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: primaryColor),
                        child: Center(
                          child: subheadingSmallBoldText(
                            context,
                            'Tracking',
                            11,
                            whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
