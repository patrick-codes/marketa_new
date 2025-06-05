import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/color/colors.dart';
import 'package:marketa_new/helpers/text%20style/text_style.dart';
import 'package:marketa_new/helpers/widgets/custom_button.dart';
import 'package:marketa_new/helpers/widgets/custom_textform_field.dart';
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
                headingText(context, 'Create Account'),
                SizedBox(height: 3),
                subheadingText(
                    context, 'start shopping by creating an account'),
                SizedBox(height: 30),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelTextSmall(context, 'Username'),
                      SizedBox(height: 7),
                      textFormField(
                        context,
                        'Create Username',
                        MingCute.user_3_line,
                        TextInputType.text,
                        _focusNode1,
                      ),
                      SizedBox(height: 20),
                      labelTextSmall(context, 'Email'),
                      SizedBox(height: 7),
                      emailtextFormField(context, _focusNode2),
                      SizedBox(height: 20),
                      labelTextSmall(context, 'Password'),
                      SizedBox(height: 7),
                      passwordTextFormField(context, _focusNode3)
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
                    labelTextFaint(context, 'Or using other method'),
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
