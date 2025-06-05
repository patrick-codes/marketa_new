import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import '../../../helpers/color/colors.dart';
import '../../../helpers/widgets/custom_button.dart';

class OtpComponents {
  static final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
      fontSize: 22,
      color: blackColor,
      fontWeight: FontWeight.bold,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: outlineGrey),
    ),
  );

  static Future<void> scrollBottomSheet(
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
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 7.5,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: primarySucessShade,
                        borderRadius: BorderRadius.circular(120),
                      ),
                      child: Center(
                        child: Container(
                          height: 85,
                          width: 85,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: whiteColor,
                              ),
                              child: Icon(
                                Icons.done_rounded,
                                size: 17,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      textAlign: TextAlign.center,
                      'Registration Successful!',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: blackColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      textAlign: TextAlign.center,
                      'Congratulations! your account has being created. Please login to get amazing experiences.',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: subtitleColor,
                            fontSize: 13,
                          ),
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'Go to Homepage',
                      onpressed: () {
                        key.currentState!.validate();
                      },
                      color: primaryColor,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
