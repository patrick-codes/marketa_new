// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../color/colors.dart';

// ignore: must_be_immutable
class CustomNavButton extends StatelessWidget {
  String text;
  final void Function() onpressed;
  Color color;
  IconData? icon;
  CustomNavButton({
    super.key,
    required this.text,
    required this.onpressed,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        height: 50,
        width: 170,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(MingCute.shopping_cart_2_line, size: 25, color: whiteColor),
              SizedBox(width: 8),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: secondaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
