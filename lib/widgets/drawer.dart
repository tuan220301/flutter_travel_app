import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:travel_app/constants/Theme.dart';

import 'package:travel_app/widgets/drawer-tile.dart';

class NowDrawer extends StatelessWidget {
  final String currentPage;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  NowDrawer({Key? key, required this.currentPage}) : super(key: key);
  void _handleSignOut() {
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: NowUIColors.primary,
      child: Column(children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.85,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Image.asset("assets/imgs/now-logo.png"),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: IconButton(
                          icon: Icon(Icons.menu,
                              color: NowUIColors.white.withOpacity(0.82),
                              size: 24.0),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ),
                  ],
                ),
              ),
            )),
        Expanded(
          flex: 2,
          child: ListView(
            padding: const EdgeInsets.only(top: 36, left: 8, right: 16),
            children: [
              DrawerTile(
                  // ignore: deprecated_member_use
                  icon: FontAwesomeIcons.home,
                  onTap: () {
                    if (currentPage != "Home") {
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  },
                  iconColor: NowUIColors.primary,
                  title: "Home",
                  isSelected: currentPage == "Home" ? true : false),
              DrawerTile(
                  icon: FontAwesomeIcons.dharmachakra,
                  onTap: () {
                    if (currentPage != "Components") {
                      Navigator.pushReplacementNamed(context, '/components');
                    }
                  },
                  iconColor: NowUIColors.error,
                  title: "Components",
                  isSelected: currentPage == "Components" ? true : false),
              DrawerTile(
                  icon: FontAwesomeIcons.newspaper,
                  onTap: () {
                    if (currentPage != "Articles") {
                      Navigator.pushReplacementNamed(context, '/articles');
                    }
                  },
                  iconColor: NowUIColors.primary,
                  title: "Articles",
                  isSelected: currentPage == "Articles" ? true : false),
              DrawerTile(
                  icon: FontAwesomeIcons.user,
                  onTap: () {
                    if (currentPage != "Profile") {
                      Navigator.pushReplacementNamed(context, '/profile');
                    }
                  },
                  iconColor: NowUIColors.warning,
                  title: "Profile",
                  isSelected: currentPage == "Profile" ? true : false),
              DrawerTile(
                  icon: FontAwesomeIcons.fileInvoice,
                  onTap: () {
                    if (currentPage != "Account") {
                      Navigator.pushReplacementNamed(context, '/account');
                    }
                  },
                  iconColor: NowUIColors.info,
                  title: "Account",
                  isSelected: currentPage == "Account" ? true : false),
              DrawerTile(
                  // ignore: deprecated_member_use
                  icon: FontAwesomeIcons.cog,
                  onTap: () {
                    if (currentPage != "Settings") {
                      Navigator.pushReplacementNamed(context, '/settings');
                    }
                  },
                  iconColor: NowUIColors.success,
                  title: "Settings",
                  isSelected: currentPage == "Settings" ? true : false),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
              padding: const EdgeInsets.only(left: 8, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Divider(
                      height: 4,
                      thickness: 0,
                      color: NowUIColors.white.withOpacity(0.8)),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16.0, left: 16, bottom: 8),
                    child: Text("DOCUMENTATION",
                        style: TextStyle(
                          color: NowUIColors.white.withOpacity(0.8),
                          fontSize: 13,
                        )),
                  ),
                  DrawerTile(
                      icon: FontAwesomeIcons.satellite,
                      onTap: _handleSignOut,
                      iconColor: NowUIColors.muted,
                      title: "Đăng xuất",
                      isSelected:
                          currentPage == "Getting started" ? true : false),
                ],
              )),
        ),
      ]),
    ));
  }
}
