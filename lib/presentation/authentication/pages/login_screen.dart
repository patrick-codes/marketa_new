import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/color/colors.dart';
import 'package:marketa_new/helpers/widgets/custom_button.dart';

import '../../../helpers/widgets/white_custom_ button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _passwordNode2 = FocusNode();

  bool isRememberme = false;
  bool isLoginScreen = true;
  bool isSigninScreen = false;
  bool isChecked = false;
  bool isLoading = false;
  bool isToggeled = true;
  bool isVisible = true;
  final formKey = GlobalKey<FormState>();
  final emailFormKey = GlobalKey<FormState>();
  final resetFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _focusNode2.addListener(_onFocusChange);
    _focusNode3.addListener(_onFocusChange);
    _focusNode4.addListener(_onFocusChange);
    _passwordNode.addListener(_onFocusChange);
    _passwordNode2.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _passwordNode.dispose();
    _passwordNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBg,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  textAlign: TextAlign.center,
                  'Login Account',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                ),
                SizedBox(height: 3),
                Text(
                  textAlign: TextAlign.center,
                  'Please login with your registered credentials',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: subtitleColor,
                        fontSize: 12,
                      ),
                ),
                SizedBox(height: 30),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'Email',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                      ),
                      SizedBox(height: 7),
                      TextFormField(
                        // controller: SignupController.email,
                        focusNode: _focusNode2,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            print('Enter Email');
                            return 'Enter Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: subtitleColor,
                                    fontSize: 12,
                                  ),
                          prefixIcon: Icon(
                            MingCute.mail_line,
                            size: 23,
                            color: _focusNode2.hasFocus
                                ? primaryColor
                                : subtitleColor,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryBg),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          filled: true,
                          isDense: true,
                          fillColor:
                              _focusNode2.hasFocus ? whiteColor : primaryBg,
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
                        'Password',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                      ),
                      SizedBox(height: 7),
                      TextFormField(
                        // controller: SignupController.email,
                        focusNode: _focusNode3,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            print('Enter Password');
                            return 'Enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: subtitleColor,
                                    fontSize: 12,
                                  ),
                          prefixIcon: Icon(
                            MingCute.lock_line,
                            size: 23,
                            color: _focusNode3.hasFocus
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
                          fillColor:
                              _focusNode3.hasFocus ? whiteColor : primaryBg,
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
                      GestureDetector(
                        onTap: () {
                          scrollBottomSheet(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Forgot Password?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                CustomButton(
                  text: 'Create Account',
                  onpressed: () {},
                  color: primaryColor,
                ),
                SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'Or using other method',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: subtitleColor,
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 22),
                WhiteCustomButton(
                  text: 'Login with Google',
                  onpressed: () {
                    Navigator.pushNamed(context, '/otp');
                  },
                  color: Colors.transparent,
                ),
              ],
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
          expand: false,
          initialChildSize: 0.8,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          builder: (BuildContext context, ScrollController scrollController) {
            return Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Form(
                    key: emailFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          'Password Reset',
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
                          'Enter the email you registered with',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: subtitleColor,
                                    fontSize: 12,
                                  ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          textAlign: TextAlign.center,
                          'Email',
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
                          focusNode: _focusNode4,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              print('Enter Email');
                              return 'Enter Email';
                            }
                            return null;
                          },
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
                              color: _focusNode4.hasFocus
                                  ? primaryColor
                                  : subtitleColor,
                            ),
                            suffixIcon: Icon(MingCute.check_circle_fill,
                                size: 23,
                                color: _focusNode4.hasFocus
                                    ? subtitleColor
                                    : Colors.green),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: primaryBg),
                              borderRadius: BorderRadius.circular(13),
                            ),
                            filled: true,
                            isDense: true,
                            fillColor:
                                _focusNode4.hasFocus ? whiteColor : primaryBg,
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
                    text: 'Send Code',
                    onpressed: () {
                      if (emailFormKey.currentState!.validate()) {
                        Navigator.pop(context);
                        resetPasswordBottomSheet(context);
                      }
                    },
                    color: primaryColor,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> resetPasswordBottomSheet(BuildContext context) {
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
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
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
                          focusNode: _passwordNode,
                          validator: (value) {
                            if (value!.isEmpty) {
                              print('Enter New Password');
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
                              color: _passwordNode.hasFocus
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
                            fillColor:
                                _passwordNode.hasFocus ? whiteColor : primaryBg,
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
                          focusNode: _passwordNode2,
                          validator: (value) {
                            if (value!.isEmpty) {
                              print('Confirm New Password');
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
                              color: _passwordNode2.hasFocus
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
                            fillColor: _passwordNode2.hasFocus
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
                      formKey.currentState!.validate();
                      Navigator.pushNamed(context, '/mainhome');
                    },
                    color: primaryColor,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
