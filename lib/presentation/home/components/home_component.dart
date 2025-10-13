import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/text%20style/text_style.dart';
import 'package:marketa_new/helpers/widgets/cedi_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../helpers/animation/showup_animation.dart';
import '../../../helpers/color/colors.dart';

class HomeComponent extends StatefulWidget {
  const HomeComponent({super.key});

  @override
  State<HomeComponent> createState() => _HomeComponentState();
}

class _HomeComponentState extends State<HomeComponent> {
  static final _controller = PageController();

  List<String> title = <String>[
    "Meriza Kiles Leather Bag",
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
  List<String> bannerImgs = <String>[
    "assets/images/banner3.png",
    "assets/images/banner2.png",
    "assets/images/img9.jpg",
  ];

  Widget buildStarRating(double rating, {double size = 12}) {
    // Round rating to nearest half (e.g. 3.5)
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Full stars
        for (int i = 0; i < fullStars; i++)
          Icon(MingCute.star_fill, color: Colors.amber, size: size),
        // Half star (optional)
        if (hasHalfStar)
          Icon(MingCute.star_half_fill, color: Colors.amber, size: size),
        // Empty stars
        for (int i = 0; i < emptyStars; i++)
          Icon(MingCute.star_line, color: Colors.amber, size: size),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 170,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                        controller: _controller,
                        itemCount: bannerImgs.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return ShowUpAnimation(
                            delay: 300,
                            child: banner(bannerImgs[index]),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 5),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: bannerImgs.length,
                        effect: ScrollingDotsEffect(
                          paintStyle: PaintingStyle.fill,
                          activeDotColor: primaryColor,
                          dotHeight: 5,
                          dotWidth: 5,
                          spacing: 5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                headingTextSemiBold(context, 'New Arrivals'),
                labelseeAllText(context, 'See All'),
              ],
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 5,
                childAspectRatio: 1.6,
                mainAxisExtent: 240,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: title.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/shopdetails',
                      arguments: {"id": imgs[index]},
                    );
                  },
                  child: Container(
                    width: 140,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 130,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: Image.asset(
                                    imgs[index],
                                  ).image,
                                  fit: BoxFit.cover,
                                ),
                                color: outlineGrey,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 18,
                                          width: 55,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                156, 238, 238, 238),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 2,
                                                spreadRadius: 1,
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                              ),
                                            ],
                                          ),
                                          child: Center(
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              '100 stock',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8,
                                                color: blackColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    title[index],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: blackColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    'Soft Gray | 32 lbs each',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  SizedBox(height: 3),
                                  Row(
                                    children: [
                                      const Text(
                                        'Rating: ',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      buildStarRating(2.5),
                                      const SizedBox(width: 5),
                                      const Text(
                                        '(120)',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CediSign(
                                            size: 17,
                                            weight: FontWeight.bold,
                                          ),
                                          Text(
                                            '100.99',
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: blackColor,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          CediSign(
                                            size: 14,
                                            color: Colors.grey,
                                            weight: FontWeight.bold,
                                          ),
                                          Text(
                                            '200.99',
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              decorationThickness: 1.5,
                                            ),
                                          ),
                                        ],
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget banner(
    String img,
  ) {
    return Column(
      children: [
        Container(
          height: 140,
          width: 340,
          // margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: Image.asset(img).image),
            color: secondaryColor2,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 2,
                spreadRadius: 1,
                color: secondaryColor2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
