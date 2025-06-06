import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../helpers/color/colors.dart';
import '../../../helpers/text style/text_style.dart';
import '../../../helpers/widgets/custom_appbar.dart';
import '../../../helpers/widgets/custom_button.dart';
import '../../../helpers/widgets/custom_textform_field.dart';
import '../../../helpers/widgets/outlined_custom_ button.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final controller = TextEditingController();

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'Add New Card',
        ),
      ),
      backgroundColor: secondaryBg,
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        height: 120,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: primaryContainerShade),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                text: 'Add Card',
                onpressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
                color: primaryColor),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      labelTextSmall(context, 'Card Number'),
                      SizedBox(height: 7),
                      textFormField(
                        context,
                        'Enter Card Number',
                        MingCute.card_pay_line,
                        TextInputType.text,
                        _focusNode1,
                      ),
                      SizedBox(height: 25),
                      labelTextSmall(context, 'Card Holder Name'),
                      SizedBox(height: 7),
                      textFormField(
                        context,
                        'Enter Card Holder Name',
                        MingCute.user_3_line,
                        TextInputType.text,
                        _focusNode2,
                      ),
                      SizedBox(height: 25),
                      labelTextSmall(context, 'Expired'),
                      SizedBox(height: 7),
                      textFormField(context, 'MM/YY', MingCute.calendar_2_line,
                          TextInputType.text, _focusNode3),
                      SizedBox(height: 25),
                      labelTextSmall(context, 'CVV Code'),
                      SizedBox(height: 7),
                      passwordTextFormField(
                        context,
                        _focusNode3,
                        controller,
                        Icons.password_rounded,
                        'CCV',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
