import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/color/colors.dart';
import 'package:marketa_new/helpers/widgets/custom_button.dart';

import '../../../helpers/widgets/white_custom_ button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();

  bool isRememberme = false;
  bool isSignupScreen = true;
  bool isSigninScreen = false;
  bool isChecked = false;
  bool isLoading = false;
  bool isToggeled = true;
  bool isVisible = true;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(_onFocusChange);
    _focusNode2.addListener(_onFocusChange);
    _focusNode3.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
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
                  'Create Account',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                ),
                SizedBox(height: 3),
                Text(
                  textAlign: TextAlign.center,
                  'start shopping by creating an account',
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
                        'Username',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                      ),
                      SizedBox(height: 7),
                      TextFormField(
                        // controller: SignupController.email,
                        focusNode: _focusNode1,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Username';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Create your username',
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: subtitleColor,
                                    fontSize: 12,
                                  ),
                          prefixIcon: Icon(
                            MingCute.user_3_line,
                            size: 23,
                            color: _focusNode1.hasFocus
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
                              _focusNode1.hasFocus ? whiteColor : primaryBg,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor, width: 1.5),
                            borderRadius: BorderRadius.circular(13),
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
                    ],
                  ),
                ),
                SizedBox(height: 40),
                CustomButton(
                  text: 'Create Account',
                  onpressed: () {
                    Navigator.pushNamed(context, '/mainhome');
                  },
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
                  text: 'Sign Up with Google',
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
}
