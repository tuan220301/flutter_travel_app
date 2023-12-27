import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:travel_app/constants/Theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//widgets
import 'package:travel_app/widgets/navbar.dart';
import 'package:travel_app/widgets/drawer.dart';
import 'package:travel_app/widgets/photo-album.dart';

List<String> imgArray = [
  "assets/imgs/album-1.jpg",
  "assets/imgs/album-2.jpg",
  "assets/imgs/album-3.jpg",
  "assets/imgs/album-4.jpg",
  "assets/imgs/album-5.jpg",
  "assets/imgs/album-6.jpg"
];

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: Navbar(
          title: "Profile",
          transparent: true,
        ),
        backgroundColor: NowUIColors.bgColorScreen,
        drawer: NowDrawer(currentPage: "Profile"),
        body: Stack(
          children: <Widget>[
            Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/imgs/bg-profile.png"),
                              fit: BoxFit.cover)),
                      child: Stack(
                        children: <Widget>[
                          SafeArea(
                            bottom: false,
                            right: false,
                            left: false,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0, right: 0),
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          "assets/imgs/profile-img.jpg"),
                                      radius: 65.0),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 24.0),
                                    child: Text("Ryan Scheinder",
                                        style: TextStyle(
                                            color: NowUIColors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text("Photographer",
                                        style: TextStyle(
                                            color: NowUIColors.white
                                                .withOpacity(0.85),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 24.0, left: 42, right: 32),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text("2K",
                                                style: TextStyle(
                                                    color: NowUIColors.white,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text("Friends",
                                                style: TextStyle(
                                                    color: NowUIColors.white
                                                        .withOpacity(0.8),
                                                    fontSize: 12.0))
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text("26",
                                                style: TextStyle(
                                                    color: NowUIColors.white,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text("Comments",
                                                style: TextStyle(
                                                    color: NowUIColors.white
                                                        .withOpacity(0.8),
                                                    fontSize: 12.0))
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text("48",
                                                style: TextStyle(
                                                    color: NowUIColors.white,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text("Bookmarks",
                                                style: TextStyle(
                                                    color: NowUIColors.white
                                                        .withOpacity(0.8),
                                                    fontSize: 12.0))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                Flexible(
                  flex: 1,
                  child: SingleChildScrollView(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        left: 32.0, right: 32.0, top: 42.0),
                    child: Column(children: [
                      const Text("About me",
                          style: TextStyle(
                              color: NowUIColors.text,
                              fontWeight: FontWeight.w600,
                              fontSize: 17.0)),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 24.0, right: 24, top: 30, bottom: 24),
                        child: Text(
                            "An artist of considerable range, Ryan - the name taken by Meblourne-raised, Brooklyn-based Nick Murphy - writes, performs and records all of his own music.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: NowUIColors.time)),
                      ),
                      PhotoAlbum(imgArray: imgArray)
                    ]),
                  )),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          // Respond to button press
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          // primary: NowUIColors.defaultColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        child: const Padding(
                            padding: EdgeInsets.only(
                                left: 12.0, right: 12.0, top: 10, bottom: 10),
                            child: Text("Follow",
                                style: TextStyle(fontSize: 13.0))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: RawMaterialButton(
                        constraints: BoxConstraints.tight(const Size(38, 38)),
                        onPressed: () {},
                        elevation: 4.0,
                        fillColor: NowUIColors.defaultColor,
                        padding: const EdgeInsets.all(0.0),
                        shape: const CircleBorder(),
                        child: const Icon(FontAwesomeIcons.twitter,
                            size: 14.0, color: Colors.white),
                      ),
                    ),
                    RawMaterialButton(
                      constraints: BoxConstraints.tight(const Size(38, 38)),
                      onPressed: () {},
                      elevation: 4.0,
                      fillColor: NowUIColors.defaultColor,
                      padding: const EdgeInsets.all(0.0),
                      shape: const CircleBorder(),
                      child: const Icon(FontAwesomeIcons.pinterest,
                          size: 14.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
