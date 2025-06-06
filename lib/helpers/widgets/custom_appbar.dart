import 'package:flutter/material.dart';
import 'package:marketa_new/helpers/color/colors.dart';
import '../text style/text_style.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final List<Widget>? actions;
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: secondaryBg,
      shadowColor: outlineGrey,
      scrolledUnderElevation: 0.0,
      elevation: 0.2,
      centerTitle: true,
      title: appbarText(context, widget.title),
      actions: widget.actions,
    );
  }
}
