// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../color/colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String text;
  final void Function() onpressed;
  Color color;
  IconData? icon;
  CustomButton({
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
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
