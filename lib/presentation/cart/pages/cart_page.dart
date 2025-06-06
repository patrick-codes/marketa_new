import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/text%20style/text_style.dart';

import '../../../helpers/color/colors.dart';
import '../../../helpers/widgets/custom_appbar.dart';
import '../components/cart_components.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isNotSelected = false;
  bool? isChecked = false;
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'My Cart',
          actions: [
            Icon(MingCute.shopping_bag_3_line),
            SizedBox(width: 12),
          ],
        ),
      ),
      backgroundColor: secondaryBg,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.85,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              fillColor: WidgetStateProperty.all<Color>(
                                isChecked == true
                                    ? iconGrey
                                    : Colors.transparent,
                              ),
                              side: BorderSide(
                                  color: isNotSelected == false
                                      ? outlineGrey
                                      : Colors.red,
                                  width: 1.5),
                              checkColor: primaryColor,
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  value ?? true;
                                  CartComponent.cartScrollBottomSheet(
                                      context, focusNode);
                                });
                              },
                            ),
                            Container(
                              height: 110,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset('assets/images/img.jpg')
                                      .image,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            SizedBox(
                              height: 120,
                              width: 195,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  headingCustomSemiBold(
                                      context,
                                      'Big Bag Limited Edition 229. Sleek Leather Made 2025 New Arrivals',
                                      FontWeight.w500),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      subheadingText(context, 'Color:'),
                                      SizedBox(width: 5),
                                      subheadingSmallBoldText(
                                          context, 'Brown', 11)
                                    ],
                                  ),
                                  SizedBox(height: 14),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 37,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: outlineGrey),
                                          borderRadius:
                                              BorderRadius.circular(35),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                ' -',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(width: 14),
                                              Text(
                                                '1',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(width: 14),
                                              Icon(
                                                Icons.add,
                                                size: 17,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      headingTextMedium(
                                        context,
                                        'GHC 67.00',
                                        FontWeight.w600,
                                        17,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Divider(color: outlineGrey),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
