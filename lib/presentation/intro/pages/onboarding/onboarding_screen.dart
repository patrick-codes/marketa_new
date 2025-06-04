import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../helpers/animation/showup_animation.dart';
import '../../../../helpers/color/colors.dart';
import '../../../../helpers/widgets/custom_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  TitleText? titleText;
  static final _controller = PageController();
  List<String> images = [
    "assets/images/img1.jpg",
    "assets/images/img.jpg",
    "assets/images/img2.jpg",
    // "assets/images/img3.jpg",
    // "assets/images/img4.jpg",
    // "assets/images/img5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBg,
      bottomNavigationBar: SizedBox(
        height: 150,
        child: Column(
          children: [
            SizedBox(height: 8),
            Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: infos.length,
                effect: const ExpandingDotsEffect(
                  paintStyle: PaintingStyle.fill,
                  activeDotColor: primaryColor,
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 8,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ShowUpAnimation(
                delay: 300,
                child: CustomButton(
                  text: "Create Account",
                  onpressed: () => Navigator.pushNamed(context, '/signup'),
                  color: primaryColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                'Already Have an Account?',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: PageView.builder(
              itemCount: infos.length,
              scrollDirection: Axis.horizontal,
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                final info = infos[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2.2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              info.img,
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ).image,
                          ),
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      textAlign: TextAlign.center,
                      info.title,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      textAlign: TextAlign.center,
                      info.subtitle,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: subtitleColor,
                            fontSize: 15,
                          ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class TitleText {
  String title;
  String subtitle;
  String img;

  TitleText({
    required this.title,
    required this.subtitle,
    required this.img,
  });
}

List<TitleText> infos = [
  TitleText(
    title: "Various Collections Of The Latest Products ",
    subtitle:
        "Delivers messages faster than any other application The world's fastest messaging app. It is free and secure.",
    img: "assets/images/img3.jpg",
  ),
  TitleText(
    title: "Complete Collection Of Colors And Sizes",
    subtitle:
        "Delivers messages faster than any other application The world's fastest messaging app. It is free and secure.",
    img: "assets/images/img10.jpg",
  ),
  TitleText(
    title: "Find the most Suitable Stuffs For Yourself",
    subtitle:
        "Delivers messages faster than any other application The world's fastest messaging app. It is free and secure.",
    img: "assets/images/img11.jpg",
  ),
];
