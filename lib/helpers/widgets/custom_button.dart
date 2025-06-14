// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../color/colors.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String text;
  final void Function() onpressed;
  Color color;
  Color? outlineColor;
  Color? textColor;
  IconData? icon;
  CustomButton({
    super.key,
    required this.text,
    required this.onpressed,
    required this.color,
    this.outlineColor,
    this.textColor,
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
          border: Border.all(color: outlineColor ?? Colors.transparent),
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox.shrink() ??
              //     SpinKitCircle(
              //       color: whiteColor,
              //       size: 25,
              //     ),
              // SizedBox(width: 8),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: textColor ?? whiteColor,
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
