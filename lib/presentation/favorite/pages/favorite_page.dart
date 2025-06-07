import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../helpers/color/colors.dart';
import '../../../helpers/widgets/custom_appbar.dart';
import '../../search/components/filter_screen.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FocusNode _searchNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _searchNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _searchNode.dispose();
    super.dispose();
  }

  List<String> title = <String>[
    "All",
    "Latest",
    "Most Popular",
    "Cheapest",
    "Trift",
    "Hot Sale",
  ];

  List<String> title2 = <String>[
    "Meriza Kiles",
    "The Mirac Jiz",
    "Meriza Kiles",
    "The Mirac Jiz",
    "Meriza Kiles",
    "The Mirac Jiz",
  ];

  List<String> imgs = <String>[
    "assets/images/img3.jpg",
    "assets/images/img.jpg",
    "assets/images/img.jpg",
    "assets/images/img3.jpg",
    "assets/images/img3.jpg",
    "assets/images/img.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBg,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          title: 'My Favorite',
          isLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/notification');
              },
              icon: Badge(
                child: Icon(
                  MingCute.notification_line,
                  size: 22,
                  color: iconGrey,
                ),
              ),
            ),
            SizedBox(width: 14),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SizedBox(height: 20),
                Form(
                  key: formKey,
                  child: TextFormField(
                    // controller: SignupController.email,
                    focusNode: _searchNode,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter something';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Search....',
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: subtitleColor,
                                fontSize: 12,
                              ),
                      prefixIcon: Icon(
                        MingCute.search_line,
                        size: 23,
                        color:
                            _searchNode.hasFocus ? blackColor : subtitleColor,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            scrollBottomSheet(context);
                          },
                          icon: Icon(MingCute.settings_2_line,
                              size: 20, color: blackColor)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryBg),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      filled: true,
                      isDense: true,
                      fillColor: whiteColor,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 1.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: subtitleColor),
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: 35,
                  child: ListView.builder(
                    itemCount: title.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 30,
                        width: index == 0 ? 40 : 80,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            color:
                                index == 0 ? Colors.transparent : outlineGrey,
                          ),
                          color: index == 0 ? primaryColor : whiteColor,
                        ),
                        child: Center(
                          child: Text(
                            title[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color:
                                      index == 0 ? whiteColor : subtitleColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Divider(color: outlineGrey),
                SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.6,
                    mainAxisExtent: 190,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(imgs[index]).image,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 5,
                                right: 5,
                                child: Container(
                                  height: 22,
                                  width: 22,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.shade500,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      MingCute.heart_fill,
                                      color: Colors.red,
                                      size: 12,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              title2[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: blackColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                  ),
                            ),
                            SizedBox(height: 3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Lisa Robber',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                        color: Colors.black45,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(height: 3),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'GHC 195.00',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: blackColor,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  },
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
      showDragHandle: true,
      isDismissible: true,
      //  isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.9,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder: (BuildContext context, ScrollController scrollController) {
            return FilterScreen();
          },
        );
      },
    );
  }
}
