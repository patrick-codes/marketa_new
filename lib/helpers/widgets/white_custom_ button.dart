// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../color/colors.dart';

// ignore: must_be_immutable
class WhiteCustomButton extends StatelessWidget {
  String text;
  final void Function() onpressed;
  Color color;
  IconData? icon;
  Brand? brand;
  WhiteCustomButton({
    super.key,
    required this.text,
    required this.onpressed,
    required this.color,
    this.icon,
    this.brand,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: secondaryColor3,
          ),
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Brand(Brands.google, size: 26),
              SizedBox(width: 8),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: blackColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
