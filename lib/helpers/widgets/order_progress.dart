import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../color/colors.dart';
import '../text style/text_style.dart';

class OrderProgressWidget extends StatelessWidget {
  const OrderProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headingCustomSemiBold(
            context, 'Progress of your Order', FontWeight.w700),
        SizedBox(height: 15),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/mainshop');
          },
          minLeadingWidth: 2,
          horizontalTitleGap: 8,
          minTileHeight: 5,
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 5),
          leading: CircleAvatar(
            backgroundColor: primaryColor,
            radius: 20,
            child: Icon(
              MingCute.store_2_line,
              size: 20,
              color: whiteColor,
            ),
          ),
          title: Text(
            'Upbox Bag',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Shop',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.green,
                      //subtitleColor
                    ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.circle,
                size: 8,
                color: Colors.green,
              ),
              SizedBox(width: 10),
              Text(
                '02:50PM',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.green,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 18,
          width: 47,
          child: Center(
            child: Container(
              height: 18,
              width: 1.5,
              color: primaryColor,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/mainshop');
          },
          minLeadingWidth: 2,
          horizontalTitleGap: 8,
          minTileHeight: 5,
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 5),
          leading: CircleAvatar(
            backgroundColor: primaryColor,
            radius: 20,
            child: Icon(
              Icons.bike_scooter,
              size: 20,
              color: whiteColor,
            ),
          ),
          title: Text(
            'On the way',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Delivery',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.green,
                      //subtitleColor
                    ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.circle,
                size: 8,
                color: Colors.green,
              ),
              SizedBox(width: 10),
              Text(
                '03:20PM',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.green,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 18,
          width: 47,
          child: Center(
            child: Container(
              height: 18,
              width: 1.5,
              color: subtitleColor,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/mainshop');
          },
          minLeadingWidth: 2,
          horizontalTitleGap: 8,
          minTileHeight: 5,
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 5),
          leading: CircleAvatar(
            backgroundColor: subtitleColor,
            radius: 20,
            child: Icon(
              MingCute.location_line,
              size: 20,
              color: whiteColor,
            ),
          ),
          title: Text(
            'Weija D/A Methodist School',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Address',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: subtitleColor,
                    ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.circle,
                size: 8,
                color: subtitleColor,
              ),
              SizedBox(width: 10),
              Text(
                '03:45PM',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: subtitleColor,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
