import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/text%20style/text_style.dart';
import 'package:marketa_new/presentation/authentication/bloc/auth_bloc.dart';
import 'package:marketa_new/presentation/authentication/bloc/auth_states.dart';
import '../../../helpers/color/colors.dart';
import '../../../helpers/widgets/custom_appbar.dart';
import '../../../helpers/widgets/custom_button.dart';
import '../../authentication/bloc/auth_events.dart';
import '../components/checkout_component.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final FocusNode node = FocusNode();
  GlobalKey<FormState> key = GlobalKey();

  @override
  void initState() {
    super.initState();
    node.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    node.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ProfileLoggedOut) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Logout succesfull!")),
          );
          Navigator.pushReplacementNamed(context, "/login");
        }
        // if (state is AuthError) {
        //   WidgetsBinding.instance.addPostFrameCallback((_) {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(
        //           duration: Duration(seconds: 3),
        //           content: Text("${state.message}!")),
        //     );
        //   });
        // }
      },
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: CustomAppBar(
              title: 'Payment',
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    subheadingText(context, 'Total Amount'),
                    headingCustomSemiBold(
                      context,
                      ' GHC 99.00',
                      FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(height: 8),
                CustomButton(
                  text: 'Checkout Now',
                  onpressed: () async {
                    debugPrint("Pressed Checkout");
                    final checkoutUrl =
                        'https://checkout.paystack.com/oi28iw83w1xeoot';
                    try {
                      final Uri paystackUri = Uri.parse(checkoutUrl);

                      // Open in external browser (e.g. Chrome, Safari)
                      if (!await launchUrl(
                        paystackUri,
                        mode: LaunchMode.externalApplication,
                      )) {
                        throw Exception('Could not launch Paystack checkout');
                      }

                      // Optional: Show a snackbar or loading screen if needed
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Redirecting to Paystack...'),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error: ${e.toString()}'),
                        ),
                      );
                    } // if (state is AuthAuthenticated) {
                    //   CheckoutComponent.orderSuccesScrollBottomSheet(
                    //       context, key);
                    // } else {
                    //   showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return AlertDialog(
                    //         backgroundColor: Colors.white,
                    //         shape: const RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.vertical(
                    //             top: Radius.circular(8.0),
                    //             bottom: Radius.circular(8),
                    //           ),
                    //         ),
                    //         title: Center(
                    //           child: headingTextMedium(
                    //             context,
                    //             'Action Needed!',
                    //             FontWeight.bold,
                    //             16,
                    //             Colors.red,
                    //           ),
                    //         ),
                    //         content: SizedBox(
                    //           height: 150,
                    //           child: Column(
                    //             children: [
                    //               headingTextMedium(
                    //                 context,
                    //                 'Login or register an account to continue checking out',
                    //                 FontWeight.w500,
                    //                 12,
                    //               ),
                    //               SizedBox(height: 13.5),
                    //               GestureDetector(
                    //                 onTap: () {
                    //                   Navigator.pop(context);
                    //                   Navigator.pushNamed(context, '/login');
                    //                 },
                    //                 child: Container(
                    //                   height: 45,
                    //                   width: MediaQuery.of(context).size.width,
                    //                   decoration: BoxDecoration(
                    //                     borderRadius: BorderRadius.circular(25),
                    //                     border: Border.all(
                    //                       color: primaryColor,
                    //                     ),
                    //                   ),
                    //                   child: Center(
                    //                     child: headingTextMedium(
                    //                       context,
                    //                       'Login',
                    //                       FontWeight.w600,
                    //                       12,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //               SizedBox(height: 12),
                    //               GestureDetector(
                    //                 onTap: () {
                    //                   Navigator.pop(context);
                    //                   Navigator.pushNamed(context, '/signup');
                    //                 },
                    //                 child: Container(
                    //                   height: 45,
                    //                   width: MediaQuery.of(context).size.width,
                    //                   decoration: BoxDecoration(
                    //                     borderRadius: BorderRadius.circular(25),
                    //                     border: Border.all(
                    //                       color: primaryColor,
                    //                     ),
                    //                   ),
                    //                   child: Center(
                    //                     child: headingTextMedium(
                    //                       context,
                    //                       'Signup',
                    //                       FontWeight.w600,
                    //                       12,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         actions: [
                    //           GestureDetector(
                    //             onTap: () {
                    //               Navigator.pop(context);
                    //             },
                    //             child: headingTextMedium(
                    //               context,
                    //               'Cancel',
                    //               FontWeight.w600,
                    //               12,
                    //             ),
                    //           ),
                    //         ],
                    //       );
                    //     },
                    //   );
                    // }
                  },
                  color: primaryColor,
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      headingCustomSemiBold(
                        context,
                        'Address',
                        FontWeight.bold,
                      ),
                      labelseeAllText(context, 'Edit', () {
                        CheckoutComponent.addressBottomSheet(context, node);
                      }),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 80,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset('assets/images/img.jpg').image,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 80,
                        width: 190,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            headingCustomSemiBold(
                                context, 'House', FontWeight.w500),
                            SizedBox(height: 5),
                            subheadingText(
                                context,
                                '5482 Lafa Road Weija-Gbawe, Acrra Ghana',
                                TextAlign.start),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(color: outlineGrey),
                  SizedBox(height: 20),
                  headingCustomSemiBold(context, 'Products (3)'),
                  SizedBox(height: 15),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 65,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          Image.asset('assets/images/img.jpg')
                                              .image,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                SizedBox(
                                  height: 65,
                                  width: 195,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      headingCustomSemiBold(
                                          context,
                                          'Big Bag Limited Edition',
                                          FontWeight.w500),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              subheadingText(context, 'Color:'),
                                              SizedBox(width: 5),
                                              subheadingSmallBoldText(
                                                  context, 'Brown', 10),
                                            ],
                                          ),
                                          headingTextMedium(
                                            context,
                                            'GHC 27.00',
                                            FontWeight.w600,
                                            12,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  headingCustomSemiBold(context, 'Payment Method'),
                  SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      context.read<AuthBloc>().add(LogoutProfile());
                      // CheckoutComponent.paymentMethodBottomSheet(context);
                    },
                    child: Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: outlineGrey),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(65),
                                  color: primaryContainerShade,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset('assets/images/at.png')
                                        .image,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              SizedBox(
                                height: 60,
                                width: 240,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    headingCustomSemiBold(context,
                                        'AirtelTigo Money', FontWeight.w500),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        subheadingText(
                                            context, '******** 1234'),
                                        Icon(
                                          MingCute.right_line,
                                          size: 25,
                                          color: iconGrey,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
