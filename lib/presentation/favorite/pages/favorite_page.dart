import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/widgets/cedi_widget.dart';
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
  Widget buildStarRating(double rating, {double size = 12}) {
    // Round rating to nearest half (e.g. 3.5)
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Full stars
        for (int i = 0; i < fullStars; i++)
          Icon(MingCute.star_fill, color: Colors.amber, size: size),
        // Half star (optional)
        if (hasHalfStar)
          Icon(MingCute.star_half_fill, color: Colors.amber, size: size),
        // Empty stars
        for (int i = 0; i < emptyStars; i++)
          Icon(MingCute.star_line, color: Colors.amber, size: size),
      ],
    );
  }

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
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1.6,
                    mainAxisExtent: 240,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: title.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/shopdetails',
                          arguments: {"id": imgs[index]},
                        );
                      },
                      child: Container(
                        width: 140,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 130,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: Image.asset(
                                        imgs[index],
                                      ).image,
                                      fit: BoxFit.cover,
                                    ),
                                    color: outlineGrey,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              height: 18,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    156, 238, 238, 238),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 2,
                                                    spreadRadius: 1,
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                  ),
                                                ],
                                              ),
                                              child: Center(
                                                child: Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: true,
                                                  '100 stock',
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 8,
                                                    color: blackColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        title[index],
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: blackColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        'Soft Gray | 32 lbs each',
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.black45,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Row(
                                        children: [
                                          const Text(
                                            'Rating: ',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                          buildStarRating(2.5),
                                          const SizedBox(width: 5),
                                          const Text(
                                            '(120)',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 3),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              CediSign(
                                                size: 17,
                                                weight: FontWeight.bold,
                                              ),
                                              Text(
                                                '100.99',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: blackColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              CediSign(
                                                size: 14,
                                                color: Colors.grey,
                                                weight: FontWeight.bold,
                                              ),
                                              Text(
                                                '200.99',
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  decorationThickness: 1.5,
                                                ),
                                              ),
                                            ],
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
