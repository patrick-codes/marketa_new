import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import '../../../helpers/color/colors.dart';
import '../../../helpers/images/image_helpers.dart';
import '../../../helpers/text style/text_style.dart';
import '../../../helpers/widgets/custom_button.dart';

final formKey = GlobalKey<FormState>();

List<String> imgs = <String>[
  mtn,
  telecel,
  at,
];

List<String> paymentMethods = <String>[
  'Mtn Mobile Money',
  'Telecel Cash',
  'AirtelTigo Money',
];

bool isNotSelected = false;
bool? isChecked = false;

class CheckoutComponent {
  static Future<void> addressBottomSheet(
    BuildContext context, [
    FocusNode? locationNode,
  ]) {
    return showModalBottomSheet(
      context: context,
      //showDragHandle: true,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: whiteColor,
      shape: ContinuousRectangleBorder(),
      builder: (BuildContext context) {
        return AnimatedPadding(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.9,
            minChildSize: 0.3,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Scaffold(
                backgroundColor: secondaryBg,
                bottomNavigationBar: Container(
                  padding: EdgeInsets.all(15),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryContainerShade),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                          text: 'Confirm',
                          onpressed: () {
                            Navigator.pushNamed(context, '/cart');
                          },
                          color: primaryColor),
                    ],
                  ),
                ),
                body: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(MingCute.close_line),
                          ),
                        ],
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            headingTextSemiBold(
                                context, 'Choose your location'),
                            SizedBox(height: 3),
                            subheadingText(
                              context,
                              'Lets find your address. Choose a location below to get started.',
                              TextAlign.start,
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              // controller: SignupController.email,
                              obscureText: true,
                              focusNode: locationNode,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Choose Your Location';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Search location',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: subtitleColor,
                                      fontSize: 12,
                                    ),
                                prefixIcon: Icon(
                                  MingCute.location_fill,
                                  size: 23,
                                  color: locationNode!.hasFocus
                                      ? primaryColor
                                      : subtitleColor,
                                ),
                                suffixIcon: Icon(
                                  Icons.location_searching_rounded,
                                  size: 23,
                                  color: subtitleColor,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryBg),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                filled: true,
                                isDense: true,
                                fillColor: locationNode.hasFocus
                                    ? whiteColor
                                    : primaryBg,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: primaryColor, width: 1.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: primaryBg),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            headingTextSemiBold(context, 'Select Location'),
                            SizedBox(height: 15),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.87,
                              child: ListView.builder(
                                itemCount: 3,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 87,
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.all(12),
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: outlineGrey),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 60,
                                              width: 240,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  headingCustomSemiBold(
                                                      context,
                                                      'Dansoman',
                                                      FontWeight.w700),
                                                  SizedBox(height: 3),
                                                  subheadingText(context,
                                                      'Dansoman Exhibition'),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              width: 50,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(65),
                                                color: primaryContainerShade,
                                                // image: DecorationImage(
                                                //   fit: BoxFit.cover,
                                                //   image: Image.asset(
                                                //           'assets/images/at.png')
                                                //       .image,
                                                // ),
                                              ),
                                              child: Icon(
                                                MingCute.location_fill,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  static Future<void> paymentMethodBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: whiteColor,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (BuildContext context) {
        return AnimatedPadding(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.8,
            minChildSize: 0.3,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headingTextSemiBold(context, 'Payment Method'),
                    SizedBox(height: 15),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: ListView.builder(
                        itemCount: imgs.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
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
                                            imgs[index],
                                          ).image,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    SizedBox(
                                      height: 60,
                                      width: 235,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              headingCustomSemiBold(
                                                  context,
                                                  paymentMethods[index],
                                                  FontWeight.w700),
                                              SizedBox(height: 3),
                                              subheadingText(
                                                  context, '******** 1234'),
                                            ],
                                          ),
                                          Checkbox(
                                            fillColor:
                                                WidgetStateProperty.all<Color>(
                                              isChecked == true
                                                  ? iconGrey
                                                  : Colors.transparent,
                                            ),
                                            side: BorderSide(
                                                color: isNotSelected == false
                                                    ? outlineGrey
                                                    : Colors.red,
                                                width: 1.5),
                                            checkColor: primaryColor,
                                            value: isChecked,
                                            onChanged: (value) {},
                                          ),
                                        ],
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
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/addcard');
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: outlineGrey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_circle_outline_outlined,
                              color: iconGrey,
                            ),
                            SizedBox(width: 5),
                            labelTextRegular(
                                context, 'Add Payment Method', iconGrey),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 35),
                    CustomButton(
                      text: 'Confirm Payment Method',
                      onpressed: () {},
                      color: primaryColor,
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  static Future<void> orderSuccesScrollBottomSheet(
      BuildContext context, GlobalKey<FormState> key) {
    return showModalBottomSheet(
      context: context,
      clipBehavior: Clip.hardEdge,
      //enableDrag: true,
      //useSafeArea: true,
      showDragHandle: true,
      isDismissible: true,
      //isScrollControlled: true,
      backgroundColor: whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          //expand: false,
          initialChildSize: 0.9,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          builder: (BuildContext context, ScrollController scrollController) {
            return Stack(
              children: [
                LottieBuilder.asset(
                    repeat: false,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    'assets/animations/Animation - 1749291435644.json'),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        LottieBuilder.asset(
                            height: 150,
                            width: 150,
                            'assets/animations/Animation - 1749291094920.json'),
                        SizedBox(height: 25),
                        Text(
                          textAlign: TextAlign.center,
                          'Order Successful!',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: blackColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          textAlign: TextAlign.center,
                          'Your order will be packaged by the clerk. It will arrive at your location in 3 to 4 days',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: subtitleColor,
                                    fontSize: 13,
                                  ),
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          text: 'Order Tracking',
                          onpressed: () {
                            Navigator.pushNamed(context, '/tracking');
                          },
                          color: primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
