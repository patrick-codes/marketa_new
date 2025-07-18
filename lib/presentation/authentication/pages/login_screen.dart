import 'package:flutter/material.dart';
import 'package:marketa_new/helpers/color/colors.dart';
import 'package:marketa_new/helpers/text%20style/text_style.dart';
import 'package:marketa_new/helpers/widgets/custom_button.dart';
import 'package:marketa_new/helpers/widgets/custom_textform_field.dart';
import 'package:marketa_new/presentation/authentication/components/password_reset_component.dart';

import '../../../helpers/widgets/outlined_custom_ button.dart';

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
      resizeToAvoidBottomInset: true,
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
                headingText(context, 'Login Account'),
                SizedBox(height: 3),
                subheadingText(
                    context, 'Please login with your registered credentials'),
                SizedBox(height: 30),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelTextSmall(context, 'Email'),
                      SizedBox(height: 7),
                      emailtextFormField(context, _focusNode2),
                      SizedBox(height: 20),
                      labelTextSmall(context, 'Password'),
                      SizedBox(height: 7),
                      passwordTextFormField(context, _focusNode3),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          ForgotPasswordComponent.scrollBottomSheet(
                            context,
                            _focusNode4,
                            _passwordNode,
                            _passwordNode2,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            labelTextRegular(
                              context,
                              'Forgot Password?',
                              primaryColor,
                            )
                          ],
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
                    labelTextFaint(context, 'Or using other method'),
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
}
