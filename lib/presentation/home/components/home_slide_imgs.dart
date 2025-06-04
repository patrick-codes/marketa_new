import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../helpers/color/colors.dart';

class TopBannerSection extends StatefulWidget {
  const TopBannerSection({super.key});

  @override
  State<TopBannerSection> createState() => _TopBannerSectionState();
}

class _TopBannerSectionState extends State<TopBannerSection> {
  static final _controller = PageController();

  List<String> images = <String>[
    "assets/images/banner.png",
    "assets/images/banner2.png",
    "assets/images/banner3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CarouselSlider(
        options: CarouselOptions(
          height: 180,
          //autoPlay: true,

          autoPlayInterval: const Duration(seconds: 5),
          //enlargeCenterPage: true,
        ),
        items: images.map((e) {
          return Builder(
            builder: (BuildContext context) => SizedBox(
              height: 175,
              child: Column(
                children: [
                  Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    // padding: const EdgeInsets.symmetric(
                    //   horizontal: 20,
                    //   vertical: 20,
                    // ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(e).image,
                      ),
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
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
          );
        }).toList(),
      ),
    );
  }
}
