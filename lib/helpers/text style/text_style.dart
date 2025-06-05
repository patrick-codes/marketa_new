import 'package:flutter/material.dart';
import '../color/colors.dart';

regularText(
  context,
  String text,
  double size,
  Color color,
  FontWeight weight,
) {
  Text(
    text,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: size,
          color: color,
          fontWeight: weight,
        ),
  );
}

headingText(context, String text) {
  return Text(
    textAlign: TextAlign.center,
    text,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
  );
}

headingTextMedium(context, String text) {
  return Text(
    textAlign: TextAlign.center,
    text,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 19,
        ),
  );
}

headingTextSmall(context, String text) {
  return Text(
    textAlign: TextAlign.center,
    text,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: blackColor,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
  );
}

headingTextSemiBold(context, String text) {
  return Text(
    textAlign: TextAlign.center,
    text,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
  );
}

headingTextSemiBold2(context, String text) {
  return Text(
    textAlign: TextAlign.center,
    text,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: blackColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
  );
}

appbarText(context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
  );
}

appbarSubText(context, String text, double size) {
  return Text(
    text,
    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w500,
          color: iconGrey,
          fontSize: size,
        ),
  );
}

subheadingText(context, String text) {
  return Text(
    textAlign: TextAlign.center,
    text,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: subtitleColor,
          fontSize: 13,
        ),
  );
}

subheadingSmallBoldText(context, String text, double size) {
  return Text(
    textAlign: TextAlign.center,
    text,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: blackColor,
          fontSize: size,
          fontWeight: FontWeight.w600,
        ),
  );
}

subheadingTextMedium(context, String text) {
  return Text(
    textAlign: TextAlign.center,
    text,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: subtitleColor,
          fontSize: 15,
        ),
  );
}

labelTextSmall(context, String text) {
  return Text(
    textAlign: TextAlign.center,
    text,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: blackColor,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
  );
}

labelTextRegular(context, String text, Color color) {
  return Text(
    textAlign: TextAlign.center,
    text,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
  );
}

labelTextFaint(context, String text) {
  return Text(
    textAlign: TextAlign.center,
    text,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: subtitleColor,
          fontSize: 12,
        ),
  );
}

labelTextSemiBold(context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: primaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
  );
}

labelseeAllText(context, String text) {
  return Text(
    textAlign: TextAlign.center,
    text,
    style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: primaryColor,
          fontWeight: FontWeight.w600,
          fontSize: 11.5,
        ),
  );
}
