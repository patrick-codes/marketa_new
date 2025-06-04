import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../helpers/color/colors.dart';
import '../../../helpers/widgets/custom_button.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<Color> colors = <Color>[
    blackColor,
    primaryColor,
    Colors.orange,
    Colors.red,
    Colors.green,
    Colors.pink,
    Colors.yellow,
  ];

  List<String> location = <String>[
    "Accra",
    "Kumasi",
    "Takoradi",
    "Koforidua",
    "Cape Coast",
    "Winneba",
    "Sunyani",
    "Tamale",
  ];

  bool isStars = true;

  int selectedIndex = -1;

  double price = 1000.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Filter By",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Text(
                    "Price Range",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                SizedBox(height: 3),
                SizedBox(
                  height: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Slider(
                              allowedInteraction: SliderInteraction.slideThumb,
                              value: price,
                              min: 10,
                              max: 1000,
                              //divisions: 10,
                              thumbColor: primaryColor,
                              activeColor: primaryColor,
                              inactiveColor: outlineGrey,
                              label: price.toStringAsFixed(0),
                              onChanged: (value) {
                                setState(() {
                                  price = value;
                                });
                              },
                            ),
                          ),
                          Text(
                            "GHC ${price.toInt()}",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 15.0, right: 15),
                //   child: Text(
                //     'Color',
                //     style: Theme.of(context).textTheme.bodySmall!.copyWith(
                //           fontSize: 13,
                //           fontWeight: FontWeight.w600,
                //         ),
                //   ),
                // ),
                // const SizedBox(height: 8),
                // SizedBox(
                //   height: 70,
                //   width: MediaQuery.of(context).size.width,
                //   child: ListView.builder(
                //     itemCount: colors.length,
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (BuildContext context, int index) {
                //       return buildColorCircle(
                //         context,
                //         colors[index],
                //         index == 0
                //             ? Icons.done_outline_rounded
                //             : MingCute.minus_circle_line,
                //       );
                //     },
                //   ),
                // ),

                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Text(
                    "Location",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                SizedBox(height: 8),
                SizedBox(
                  height: 35,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: location.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildLocationButton(
                        context,
                        location[index],
                        index == 0 ? primaryColor : primaryContainerShade,
                        index == 0 ? whiteColor : primaryColor,
                      );
                    },
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                      text: 'Apply Filter',
                      onpressed: () {
                        Navigator.pop(context);
                      },
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildColorCircle(BuildContext context, Color color, IconData icon) {
    return Column(
      children: [
        Container(
          height: 30,
          width: 30,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: color,
          ),
          child: Center(
            child: Icon(
              icon,
              size: 13,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLocationButton(
      BuildContext context, String title, Color bgcolor, Color textcolor) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 3),
      child: Container(
        height: 30,
        width: 90,
        margin: const EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(11),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: textcolor,
                  fontSize: 11,
                ),
          ),
        ),
      ),
    );
  }
}
