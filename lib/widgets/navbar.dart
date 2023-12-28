import 'package:flutter/material.dart';
import 'package:travel_app/constants/Theme.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool backButton;
  final bool transparent;
  final bool reverseTextcolor;
  final bool rightOptions;
  final Function? getCurrentPage;
  final bool noShadow;
  final Color? bgColor;

  Navbar({
    this.title = "Home",
    this.transparent = false,
    this.rightOptions = true,
    this.reverseTextcolor = false,
    this.getCurrentPage,
    this.backButton = false,
    this.noShadow = false,
    this.bgColor = NowUIColors.white,
  });

  final double _prefferedHeight = 180.0;

  @override
  // ignore: library_private_types_in_public_api
  _NavbarState createState() => _NavbarState();

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}

class _NavbarState extends State<Navbar> {
  late String activeTag;
  Size get preferredSize => const Size.fromHeight(75);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: preferredSize.height,
        decoration: BoxDecoration(
            color: !widget.transparent ? widget.bgColor : Colors.transparent,
            boxShadow: [
              BoxShadow(
                  color: !widget.transparent && !widget.noShadow
                      ? NowUIColors.muted
                      : Colors.transparent,
                  spreadRadius: -10,
                  blurRadius: 12,
                  offset: const Offset(0, 5))
            ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                                !widget.backButton
                                    ? Icons.menu
                                    : Icons.arrow_back_ios,
                                color: !widget.transparent
                                    ? (widget.bgColor == NowUIColors.white
                                        ? NowUIColors.text
                                        : NowUIColors.white)
                                    : (widget.reverseTextcolor
                                        ? NowUIColors.text
                                        : NowUIColors.white),
                                size: 24.0),
                            onPressed: () {
                              if (!widget.backButton) {
                                Scaffold.of(context).openDrawer();
                              } else {
                                Navigator.pop(context);
                              }
                            }),
                        Text(widget.title,
                            style: TextStyle(
                                color: !widget.transparent
                                    ? (widget.bgColor == NowUIColors.white
                                        ? NowUIColors.text
                                        : NowUIColors.white)
                                    : (widget.reverseTextcolor
                                        ? NowUIColors.text
                                        : NowUIColors.white),
                                fontWeight: FontWeight.w400,
                                fontSize: 18.0)),
                      ],
                    ),
                    if (widget.rightOptions)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const Cart()));
                            },
                            child: IconButton(
                                icon: Icon(Icons.map_outlined,
                                    color: !widget.transparent
                                        ? (widget.bgColor == NowUIColors.white
                                            ? NowUIColors.text
                                            : NowUIColors.white)
                                        : (widget.reverseTextcolor
                                            ? NowUIColors.text
                                            : NowUIColors.white),
                                    size: 30.0),
                                onPressed: null),
                          ),
                        ],
                      )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
