import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../helpers/animation/showup_animation.dart';
import '../../../../../helpers/color/colors.dart';
import '../../../../../helpers/text style/text_style.dart';
import '../../../../../helpers/widgets/custom_button.dart';
import '../repository/model/onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static final _controller = PageController();

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
              child: labelTextSemiBold(context, 'Already Have an Account?'),
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
                    headingTextMedium(context, info.title),
                    SizedBox(height: 20),
                    subheadingTextMedium(context, info.subtitle),
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
