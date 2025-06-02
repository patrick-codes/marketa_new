import 'package:flutter/material.dart';
import 'package:marketa_new/helpers/color/colors.dart';
import 'package:marketa_new/helpers/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  final defaultPinTheme = PinTheme(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBg,
      appBar: AppBar(
        backgroundColor: secondaryBg,
        shadowColor: outlineGrey,
        elevation: 0.2,
        centerTitle: true,
        title: Text(
          'Verification',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: primaryContainerShade,
                      borderRadius: BorderRadius.circular(120),
                    ),
                    child: Center(
                      child: Container(
                        height: 85,
                        width: 85,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.mail_lock_rounded,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    textAlign: TextAlign.center,
                    'Verification Code',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    textAlign: TextAlign.center,
                    'We have sent a verification code to',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: subtitleColor,
                          fontSize: 13,
                        ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    textAlign: TextAlign.center,
                    'kofiktechgh@gmail.com',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: blackColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(height: 30),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Pinput(
                            // smsRetriever: smsRetriever,
                            length: 5,
                            controller: pinController,
                            focusNode: focusNode,
                            defaultPinTheme: defaultPinTheme,
                            separatorBuilder: (index) =>
                                const SizedBox(width: 8),
                            validator: (value) {
                              return value == '22222'
                                  ? null
                                  : 'Pin is incorrect';
                            },
                            hapticFeedbackType: HapticFeedbackType.lightImpact,
                            onCompleted: (pin) {
                              debugPrint('onCompleted: $pin');
                            },
                            onChanged: (value) {
                              debugPrint('onChanged: $value');
                            },
                            cursor: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 9),
                                  width: 22,
                                  height: 1,
                                  color: outlineGrey,
                                ),
                              ],
                            ),
                            focusedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: primaryColor),
                              ),
                            ),
                            submittedPinTheme: defaultPinTheme.copyWith(
                              decoration: defaultPinTheme.decoration!.copyWith(
                                color: fillColor,
                                borderRadius: BorderRadius.circular(19),
                                border: Border.all(color: Colors.green),
                              ),
                            ),
                            errorPinTheme: defaultPinTheme.copyBorderWith(
                              border: Border.all(color: Colors.redAccent),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  CustomButton(
                    text: 'Submit',
                    onpressed: () {
                      focusNode.unfocus();
                      formKey.currentState!.validate();
                      scrollBottomSheet(context);
                    },
                    color: primaryColor,
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'Didnt receive the code?',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: subtitleColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        textAlign: TextAlign.center,
                        'Resend',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: primaryColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> scrollBottomSheet(BuildContext context) {
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
                        formKey.currentState!.validate();
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
