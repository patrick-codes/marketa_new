import '../../../../../../helpers/images/image_helpers.dart';

class OnboardingText {
  String title;
  String subtitle;
  String img;

  OnboardingText({
    required this.title,
    required this.subtitle,
    required this.img,
  });
}

List<OnboardingText> infos = [
  OnboardingText(
    title: "Various Collections Of The Latest Products",
    subtitle:
        "Browse from hundreds of new items. All your favourite brands in one place. Fast delivery right to your door.",
    img: onboardingImg3,
  ),
  OnboardingText(
    title: "Complete Collection Of Colors And Sizes",
    subtitle:
        "Pick the style that suits you best. Every item comes in many options. No more guessing, just perfect fits.",
    img: onboardingImg1,
  ),
  OnboardingText(
    title: "Find the Most Suitable Stuffs For Yourself",
    subtitle:
        "Let us help you discover what you need. Smart suggestions just for you. Save time and shop with ease.",
    img: onboardingImg4,
  ),
];
