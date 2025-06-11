import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../helpers/color/colors.dart';
import '../../../helpers/text style/text_style.dart';
import '../../../helpers/widgets/custom_appbar.dart';
import '../../../helpers/widgets/custom_button.dart';
import '../../../helpers/widgets/custom_textform_field.dart';
import '../../../helpers/widgets/outlined_custom_ button.dart';
import '../../authentication/components/password_reset_component.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FocusNode _focusNode1 = FocusNode();
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          isLeading: false,
          title: 'Edit Profile',
          actions: [
            IconButton(
              onPressed: () {
                //Navigator.pushNamed(context, '/settings');
              },
              icon: Icon(
                MingCute.more_2_fill,
                size: 22,
                color: blackColor,
              ),
            ),
            SizedBox(width: 14),
          ],
        ),
      ),
      backgroundColor: secondaryBg,
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.all(12),
        child: Center(
          child: CustomButton(
            text: 'Save Changes',
            onpressed: () {
              // Navigator.pushNamed(context, '/mainhome');
            },
            color: primaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                                  fit: BoxFit.fitHeight,
                                  height: 120,
                                  width: 120,
                                  "assets/images/img.jpg")
                              .image,
                        ),
                        color: Colors.white,
                        border: Border.all(width: 4, color: primaryColor),
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                    Positioned(
                      bottom: 2,
                      left: 80,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Icon(
                            MingCute.edit_4_line,
                            color: whiteColor,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelTextSmall(context, 'Username'),
                    SizedBox(height: 7),
                    textFormField(
                      context,
                      'Boateng Patrick',
                      MingCute.user_3_line,
                      TextInputType.text,
                      _focusNode1,
                    ),
                    SizedBox(height: 15),
                    labelTextSmall(context, 'Email'),
                    SizedBox(height: 7),
                    textFormField(
                      context,
                      'kofiktechg@gmail.com',
                      Icons.mail_outline_rounded,
                      TextInputType.text,
                      _focusNode1,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
