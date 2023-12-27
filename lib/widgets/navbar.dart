import 'package:flutter/material.dart';
import 'package:travel_app/constants/Theme.dart';

// import 'package:travel_app/screens/trending.dart';
// import 'package:travel_app/screens/fashion.dart';
// import 'package:travel_app/screens/notifications.dart';
// import 'package:travel_app/screens/search.dart';
// import 'package:travel_app/screens/cart.dart';

// import 'package:travel_app/widgets/input.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  // final String categoryOne;
  // final String categoryTwo;
  // final bool searchBar;
  final bool backButton;
  final bool transparent;
  final bool reverseTextcolor;
  final bool rightOptions;
  // final List<String>? tags;
  final Function? getCurrentPage;
  // final bool isOnSearch;
  // final TextEditingController? searchController;
  // final Function? searchOnChanged;
  // final bool searchAutofocus;
  final bool noShadow;
  final Color? bgColor;

  Navbar({
    this.title = "Home",
    // this.categoryOne = "",
    // this.categoryTwo = "",
    // this.tags,
    this.transparent = false,
    this.rightOptions = true,
    this.reverseTextcolor = false,
    this.getCurrentPage,
    // this.searchController,
    // this.isOnSearch = false,
    // this.searchOnChanged,
    // this.searchAutofocus = false,
    this.backButton = false,
    this.noShadow = false,
    this.bgColor = NowUIColors.white,
    // this.searchBar = false
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

  // void initState() {
  //   if (widget.tags != null && widget.tags?.length != 0) {
  //     activeTag = widget.tags![0];
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // final bool categories =
    //     widget.categoryOne.isNotEmpty && widget.categoryTwo.isNotEmpty;

    return Container(
        height: 75,
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
                // if (widget.searchBar)
                //   Padding(
                //     padding: const EdgeInsets.only(
                //         top: 8, bottom: 0, left: 15, right: 15),
                //     child: Input(
                //         placeholder: "What are you looking for?",
                //         // controller: widget.searchController,
                //         onChanged: widget.searchOnChanged,
                //         autofocus: widget.searchAutofocus,
                //         suffixIcon: const Icon(
                //           Icons.zoom_in,
                //           color: NowUIColors.time,
                //           size: 20,
                //         ),
                //         onTap: () {
                //           if (!widget.isOnSearch) {
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                     builder: (context) => const Search()));
                //           }
                //         }),
                //   ),

                // if (categories)
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => const Trending()));
                //       },
                //       child: Row(
                //         children: [
                //           const Icon(Icons.camera,
                //               color: NowUIColors.text, size: 18.0),
                //           const SizedBox(width: 8),
                //           Text(widget.categoryOne,
                //               style: const TextStyle(
                //                   color: NowUIColors.text, fontSize: 14.0)),
                //         ],
                //       ),
                //     ),
                //     const SizedBox(width: 30),
                //     Container(
                //       color: NowUIColors.text,
                //       height: 25,
                //       width: 1,
                //     ),
                //     const SizedBox(width: 30),
                //     GestureDetector(
                //       onTap: () {
                //         Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => const Fashion()));
                //       },
                //       child: Row(
                //         children: [
                //           const Icon(Icons.shopping_cart,
                //               color: NowUIColors.text, size: 18.0),
                //           const SizedBox(width: 8),
                //           Text(widget.categoryTwo,
                //               style: const TextStyle(
                //                   color: NowUIColors.text, fontSize: 14.0)),
                //         ],
                //       ),
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ));
  }
}
