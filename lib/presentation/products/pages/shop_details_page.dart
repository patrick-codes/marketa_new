// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:marketa_new/helpers/color/colors.dart';
import 'package:marketa_new/helpers/text%20style/text_style.dart';
import 'package:marketa_new/helpers/widgets/cedi_widget.dart';
import 'package:marketa_new/helpers/widgets/custom_bottomnav_button.dart';

import '../../../helpers/images/image_helpers.dart';
import '../../../helpers/widgets/custom_appbar.dart';
import '../bloc/products_bloc.dart';

class ShopDetailsPage extends StatefulWidget {
  final String id;
  const ShopDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  static final _controller = PageController();

  @override
  State<ShopDetailsPage> createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage> {
  final List<String> imgs = <String>[
    itemImg1,
    itemImg2,
    itemImg3,
  ];
  @override
  void initState() {
    context.read<ProductsBloc>().add(LoadSingleProductEvent(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  duration: Duration(seconds: 3),
                  content: Text("${state.error}!")),
            );
          });
        }
      },
      builder: (context, state) {
        if (state is ProductsLoading) {
          return Container(
            color: whiteColor,
            height: MediaQuery.of(context).size.width,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is SingleProductSuccess) {
          return Stack(
            children: [
              Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(50),
                  child: CustomAppBar(
                    bgColor: whiteColor,
                    title: state.product.name,
                    actions: [
                      Icon(MingCute.shopping_bag_3_line),
                      SizedBox(width: 12),
                    ],
                  ),
                ),
                backgroundColor: secondaryBg,
                bottomNavigationBar: Container(
                  padding: EdgeInsets.all(10),
                  height: 75,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryContainerShade),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CediSign(
                            weight: FontWeight.bold,
                            size: 21,
                          ),
                          headingTextMedium(context, ' ${state.product.price}'),
                        ],
                      ),
                      CustomNavButton(
                          text: 'Add to Cart',
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.35,
                              child: PageView.builder(
                                controller: ShopDetailsPage._controller,
                                itemCount: state.product.images.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  final imgUrl = state.product.images[index];
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.35,
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: Image.network(
                                          imgUrl,
                                        ).image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              child: SizedBox(
                                height: 30,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SmoothPageIndicator(
                                      controller: ShopDetailsPage._controller,
                                      count: state.product.images.length,
                                      effect: JumpingDotEffect(
                                        paintStyle: PaintingStyle.stroke,
                                        activeDotColor: primaryColor,
                                        dotHeight: 8,
                                        dotWidth: 8,
                                        spacing: 8,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: ListTile(
                                  minLeadingWidth: 2,
                                  horizontalTitleGap: 8,
                                  minTileHeight: 8,
                                  minVerticalPadding: 5,
                                  isThreeLine: true,
                                  dense: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 5),
                                  title: Row(
                                    children: [
                                      headingTextMedium(
                                        context,
                                        state.product.name,
                                      ),
                                    ],
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            MingCute.stock_line,
                                            size: 20,
                                            color: Colors.blue,
                                          ),
                                          SizedBox(width: 5),
                                          subheadingSmallBoldText(
                                              context,
                                              'In stock: ${state.product.stock.toString()}',
                                              13),
                                          SizedBox(width: 5),
                                          subheadingText(
                                            context,
                                            ' (${state.product.category})',
                                            TextAlign.center,
                                            12,
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            height: 17,
                                            width:
                                                state.product.isActive == true
                                                    ? 50
                                                    : 70,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: outlineGrey,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: subheadingText(
                                                context,
                                                state.product.isActive == true
                                                    ? 'ACTIVE'
                                                    : 'NOT ACTIVE',
                                                TextAlign.center,
                                                8,
                                                1,
                                                state.product.isActive == true
                                                    ? Colors.deepOrange
                                                    : iconGrey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      subheadingText(
                                        context,
                                        'CONDITION: ${state.product.condition.toUpperCase()}',
                                        TextAlign.center,
                                        10,
                                      ),
                                    ],
                                  ),
                                  trailing: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: secondaryColor3,
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                    child: Center(
                                      child: Icon(MingCute.heart_line,
                                          color: iconGrey),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              descriptionText(
                                context,
                                state.product.description,
                                TextAlign.start,
                              ),
                              SizedBox(height: 22),
                              ListTile(
                                onTap: () {
                                  Navigator.pushNamed(context, '/mainshop');
                                },
                                minLeadingWidth: 2,
                                horizontalTitleGap: 5,
                                minTileHeight: 5,
                                dense: true,
                                contentPadding: EdgeInsets.symmetric(),
                                leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        Image.asset('assets/images/img.jpg')
                                            .image),
                                title: Row(
                                  children: [
                                    Text(
                                      state.product.seller.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                                subtitle: Row(
                                  children: [
                                    Text(
                                      'Verified Seller',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: subtitleColor,
                                          ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.verified,
                                      color: Colors.green,
                                      size: 13,
                                    ),
                                  ],
                                ),
                                trailing: Container(
                                  height: 33,
                                  width: 85,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: outlineGrey),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'View shop',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontSize: 10.5,
                                            color: primaryColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Divider(color: outlineGrey),
                              SizedBox(height: 22),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Scaffold(
            body: Center(child: Text("No product found")),
          );
        }
      },
    );
  }
}
