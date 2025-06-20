import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/text%20style/text_style.dart';
import '../../../helpers/color/colors.dart';
import 'home_slide_imgs.dart';

class HomeComponent extends StatefulWidget {
  const HomeComponent({super.key});

  @override
  State<HomeComponent> createState() => _HomeComponentState();
}

class _HomeComponentState extends State<HomeComponent> {
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
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TopBannerSection(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                headingTextSemiBold(context, 'New Arrivals'),
                labelseeAllText(context, 'See All'),
              ],
            ),
            SizedBox(height: 5),
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
                          ),
                          // Positioned(
                          //   bottom: 2,
                          //   child: Lottie.asset(
                          //     height: 100,
                          //     width: 250,
                          //     'assets/animations/Animation - 1749292768942.json',
                          //   ),
                          // ),
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
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
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
                            headingTextSemiBold2(context, 'GHC 195.00'),
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
    );
  }
}
