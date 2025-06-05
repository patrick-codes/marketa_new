import 'package:flutter/material.dart';
import 'package:marketa_new/helpers/color/colors.dart';
import 'package:marketa_new/helpers/text%20style/text_style.dart';
import 'package:marketa_new/helpers/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';

import '../components/otp_components.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBg,
      appBar: AppBar(
        backgroundColor: secondaryBg,
        shadowColor: outlineGrey,
        elevation: 0.2,
        centerTitle: true,
        title: appbarText(context, 'Verification'),
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
                  headingTextSmall(context, 'Verification Code'),
                  SizedBox(height: 5),
                  subheadingText(
                      context, 'We have sent a verification code to'),
                  SizedBox(height: 3),
                  subheadingSmallBoldText(context, 'kofiktechgh@gmail.com', 11),
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
                            defaultPinTheme: OtpComponents.defaultPinTheme,
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
                            focusedPinTheme:
                                OtpComponents.defaultPinTheme.copyWith(
                              decoration: OtpComponents
                                  .defaultPinTheme.decoration!
                                  .copyWith(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: primaryColor),
                              ),
                            ),
                            submittedPinTheme:
                                OtpComponents.defaultPinTheme.copyWith(
                              decoration: OtpComponents
                                  .defaultPinTheme.decoration!
                                  .copyWith(
                                color: fillColor,
                                borderRadius: BorderRadius.circular(19),
                                border: Border.all(color: Colors.green),
                              ),
                            ),
                            errorPinTheme:
                                OtpComponents.defaultPinTheme.copyBorderWith(
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
                      OtpComponents.scrollBottomSheet(context, formKey);
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
}
