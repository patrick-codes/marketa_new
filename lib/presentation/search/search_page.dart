import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:marketa_new/helpers/color/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _passwordNode = FocusNode();
  final FocusNode _passwordNode2 = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _focusNode2.addListener(_onFocusChange);
    _focusNode3.addListener(_onFocusChange);
    _focusNode4.addListener(_onFocusChange);
    _passwordNode.addListener(_onFocusChange);
    _passwordNode2.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _passwordNode.dispose();
    _passwordNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryBg,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        leading: Icon(
          Icons.arrow_back_ios_rounded,
          size: 22,
        ),
        title: Form(
          key: formKey,
          child: TextFormField(
            // controller: SignupController.email,
            focusNode: _focusNode4,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Enter Email';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: 'Search....',
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: subtitleColor,
                    fontSize: 12,
                  ),
              prefixIcon: Icon(
                MingCute.search_line,
                size: 23,
                color: _focusNode4.hasFocus ? blackColor : subtitleColor,
              ),
              suffixIcon: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/mainsearch');
                  },
                  icon: Icon(MingCute.close_fill,
                      size: 20, color: subtitleColor)),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: primaryBg),
                borderRadius: BorderRadius.circular(13),
              ),
              filled: true,
              isDense: true,
              fillColor: whiteColor,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: subtitleColor),
                borderRadius: BorderRadius.circular(13),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'Last Search',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      'Clear All',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 11.5,
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: outlineGrey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Electronics',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: iconGrey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            MingCute.close_line,
                            color: iconGrey,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: outlineGrey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pants',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: iconGrey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            MingCute.close_line,
                            color: iconGrey,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: outlineGrey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Second Hand',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: iconGrey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            MingCute.close_line,
                            color: iconGrey,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: outlineGrey,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Long shirt',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: iconGrey,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            MingCute.close_line,
                            color: iconGrey,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Text(
                  textAlign: TextAlign.center,
                  'Popular Search',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                ),
                SizedBox(height: 12),
                ListTile(
                  horizontalTitleGap: 10,
                  minTileHeight: 5,
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  leading: Container(
                    height: 150,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset('assets/images/img3.jpg').image),
                    ),
                  ),
                  title: Text(
                    'Lunilo Hils Jacket',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  subtitle: Text(
                    '1,6k search today',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: subtitleColor,
                        ),
                  ),
                  trailing: Container(
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color.fromARGB(197, 255, 192, 192),
                    ),
                    child: Center(
                      child: Text(
                        'Hot',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 13),
                ListTile(
                  horizontalTitleGap: 10,
                  minTileHeight: 5,
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  leading: Container(
                    height: 150,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset('assets/images/img.jpg').image),
                    ),
                  ),
                  title: Text(
                    'Denim Jeans',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  subtitle: Text(
                    '1k search today',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: subtitleColor,
                        ),
                  ),
                  trailing: Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color.fromARGB(197, 255, 237, 192),
                    ),
                    child: Center(
                      child: Text(
                        'New',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepOrange,
                            ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 13),
                ListTile(
                  horizontalTitleGap: 10,
                  minTileHeight: 5,
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  leading: Container(
                    height: 150,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset('assets/images/img3.jpg').image),
                    ),
                  ),
                  title: Text(
                    'Redil Backpack',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  subtitle: Text(
                    '1,23k search today',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: subtitleColor,
                        ),
                  ),
                  trailing: Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color.fromARGB(197, 192, 255, 205),
                    ),
                    child: Center(
                      child: Text(
                        'Popular',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 13),
                ListTile(
                  horizontalTitleGap: 10,
                  minTileHeight: 5,
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  leading: Container(
                    height: 150,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset('assets/images/img.jpg').image),
                    ),
                  ),
                  title: Text(
                    'JBL Speakers',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  subtitle: Text(
                    '1k search today',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: subtitleColor,
                        ),
                  ),
                  trailing: Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color.fromARGB(197, 255, 237, 192),
                    ),
                    child: Center(
                      child: Text(
                        'New',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepOrange,
                            ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 13),
                ListTile(
                  horizontalTitleGap: 10,
                  minTileHeight: 5,
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  leading: Container(
                    height: 150,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset('assets/images/img.jpg').image),
                    ),
                  ),
                  title: Text(
                    'Denim Jeans',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  subtitle: Text(
                    '1k search today',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: subtitleColor,
                        ),
                  ),
                  trailing: Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color.fromARGB(197, 255, 237, 192),
                    ),
                    child: Center(
                      child: Text(
                        'New',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepOrange,
                            ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 13),
                ListTile(
                  horizontalTitleGap: 10,
                  minTileHeight: 5,
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  leading: Container(
                    height: 150,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset('assets/images/img3.jpg').image),
                    ),
                  ),
                  title: Text(
                    'Redil Backpack',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  subtitle: Text(
                    '1,23k search today',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: subtitleColor,
                        ),
                  ),
                  trailing: Container(
                    height: 30,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color.fromARGB(197, 192, 255, 205),
                    ),
                    child: Center(
                      child: Text(
                        'Popular',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 13),
                ListTile(
                  horizontalTitleGap: 10,
                  minTileHeight: 5,
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  leading: Container(
                    height: 150,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset('assets/images/img.jpg').image),
                    ),
                  ),
                  title: Text(
                    'JBL Speakers',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  subtitle: Text(
                    '1k search today',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: subtitleColor,
                        ),
                  ),
                  trailing: Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color.fromARGB(197, 255, 237, 192),
                    ),
                    child: Center(
                      child: Text(
                        'New',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.deepOrange,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
