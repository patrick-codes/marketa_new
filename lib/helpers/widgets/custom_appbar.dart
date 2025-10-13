import 'package:flutter/material.dart';
import 'package:marketa_new/helpers/color/colors.dart';
import '../text style/text_style.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final List<Widget>? actions;
  final bool? isLeading;
  final Color? bgColor;
  final Color? textColor;
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.isLeading,
    this.bgColor,
    this.textColor,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.bgColor ?? whiteColor,
      shadowColor: outlineGrey,
      scrolledUnderElevation: 0.0,
      elevation: 0.2,
      centerTitle: true,
      automaticallyImplyLeading: widget.isLeading ?? true,
      title: appbarText(context, widget.title, widget.textColor),
      actions: widget.actions,
      iconTheme: IconThemeData(color: widget.textColor ?? blackColor),
    );
  }
}
