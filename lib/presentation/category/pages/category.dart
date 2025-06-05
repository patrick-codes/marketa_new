import 'package:flutter/material.dart';

import '../../../helpers/color/colors.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryComponentState();
}

class _CategoryComponentState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      //height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              // padding: const EdgeInsets.symmetric(
              //   horizontal: 20,
              //   vertical: 20,
              // ),
              margin: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset('assets/images/img.jpg').image,
                ),
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            'New Arrivals',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            '208 Products',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              // padding: const EdgeInsets.symmetric(
              //   horizontal: 20,
              //   vertical: 20,
              // ),
              margin: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset('assets/images/img.jpg').image,
                ),
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            'Clothes',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            '358 Products',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              // padding: const EdgeInsets.symmetric(
              //   horizontal: 20,
              //   vertical: 20,
              // ),
              margin: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset('assets/images/img.jpg').image,
                ),
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            'Shoes',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            '160 Products',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              // padding: const EdgeInsets.symmetric(
              //   horizontal: 20,
              //   vertical: 20,
              // ),
              margin: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset('assets/images/img.jpg').image,
                ),
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            'Electronics',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            '508 Products',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 130,
              width: MediaQuery.of(context).size.width,
              // padding: const EdgeInsets.symmetric(
              //   horizontal: 20,
              //   vertical: 20,
              // ),
              margin: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset('assets/images/img.jpg').image,
                ),
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            'Bags',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                            '230 Products',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
