import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../helpers/color/colors.dart';
import '../../../helpers/widgets/custom_button.dart';

final resetFormKey = GlobalKey<FormState>();
final emailFormKey = GlobalKey<FormState>();

class ForgotPasswordComponent {
  static Future<void> resetPasswordBottomSheet(
    BuildContext context, [
    FocusNode? passwordNode,
    FocusNode? passwordNode2,
  ]) {
    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (BuildContext context) {
        return AnimatedPadding(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.5,
            minChildSize: 0.3,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Form(
                      key: resetFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            'Create New Password',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: blackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            textAlign: TextAlign.center,
                            'Enter a new password to reset',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: subtitleColor,
                                      fontSize: 12,
                                    ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            textAlign: TextAlign.center,
                            'Password',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: blackColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                          ),
                          SizedBox(height: 7),
                          TextFormField(
                            // controller: SignupController.email,
                            focusNode: passwordNode,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter New Password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Create new password',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: subtitleColor,
                                    fontSize: 12,
                                  ),
                              prefixIcon: Icon(
                                MingCute.lock_line,
                                size: 23,
                                color: passwordNode!.hasFocus
                                    ? primaryColor
                                    : subtitleColor,
                              ),
                              suffixIcon: Icon(
                                Icons.visibility_outlined,
                                size: 23,
                                color: subtitleColor,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryBg),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              filled: true,
                              isDense: true,
                              fillColor: passwordNode.hasFocus
                                  ? whiteColor
                                  : primaryBg,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primaryColor, width: 1.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryBg),
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            textAlign: TextAlign.center,
                            'Confirm New Password',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: blackColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                          ),
                          SizedBox(height: 7),
                          TextFormField(
                            // controller: SignupController.email,
                            obscureText: true,
                            focusNode: passwordNode2,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Confirm New Password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Confirm new password',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: subtitleColor,
                                    fontSize: 12,
                                  ),
                              prefixIcon: Icon(
                                MingCute.lock_line,
                                size: 23,
                                color: passwordNode2!.hasFocus
                                    ? primaryColor
                                    : subtitleColor,
                              ),
                              suffixIcon: Icon(
                                Icons.visibility_outlined,
                                size: 23,
                                color: subtitleColor,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryBg),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              filled: true,
                              isDense: true,
                              fillColor: passwordNode2.hasFocus
                                  ? whiteColor
                                  : primaryBg,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primaryColor, width: 1.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryBg),
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'Reset Password',
                      onpressed: () {
                        resetFormKey.currentState!.validate();
                        Navigator.pushNamed(context, '/mainhome');
                      },
                      color: primaryColor,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  static Future<void> scrollBottomSheet(
    BuildContext context, [
    FocusNode? focusNode4,
    FocusNode? passwordNode,
    FocusNode? passwordNode2,
  ]) {
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
            initialChildSize: 0.4,
            minChildSize: 0.3,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      key: emailFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password Reset',
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: blackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'Enter the email you registered with',
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: subtitleColor,
                                      fontSize: 12,
                                    ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Email',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: blackColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                          ),
                          const SizedBox(height: 7),
                          TextFormField(
                            focusNode: focusNode4,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) =>
                                value!.isEmpty ? 'Enter Email' : null,
                            decoration: InputDecoration(
                              hintText: 'Enter your email',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: subtitleColor,
                                    fontSize: 12,
                                  ),
                              prefixIcon: Icon(
                                MingCute.mail_line,
                                size: 23,
                                color: focusNode4!.hasFocus
                                    ? primaryColor
                                    : subtitleColor,
                              ),
                              suffixIcon: Icon(
                                MingCute.check_circle_fill,
                                size: 23,
                                color: focusNode4.hasFocus
                                    ? subtitleColor
                                    : Colors.green,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              filled: true,
                              isDense: true,
                              fillColor:
                                  focusNode4.hasFocus ? whiteColor : primaryBg,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primaryColor, width: 1.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryBg),
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Send Code',
                      onpressed: () {
                        if (emailFormKey.currentState!.validate()) {
                          Navigator.pop(context);
                          resetPasswordBottomSheet(
                            context,
                            passwordNode,
                            passwordNode2,
                          );
                        }
                      },
                      color: primaryColor,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
