import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:travel_app/constants/Theme.dart';

//widgets
import 'package:travel_app/widgets/navbar.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<Map<String, String>> messages = [];
  final TextEditingController controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Rachel Brown",
          backButton: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ListView(
                    reverse: true,
                    shrinkWrap: true,
                    controller: _scrollController,
                    children: [
                      Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: const SizedBox(
                                height: 35,
                                width: 35,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://raw.githubusercontent.com/creativetimofficial/public-assets/master/now-ui-pro-react-native/julie.jpg"),
                                  radius: 65.0,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.25,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 15.0),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        color: NowUIColors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(4.0))),
                                    child: const Text(
                                      'Hey there! How are you today? Can we meet and talk? Thanks!',
                                      style:
                                          TextStyle(color: NowUIColors.black),
                                    )),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text('10:31 PM',
                                      style: TextStyle(
                                          color: NowUIColors.text,
                                          fontSize: 11.0)),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width /
                                        1.25,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 15.0),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        color: NowUIColors.primary,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(4.0))),
                                    child: const Text(
                                      'Sure, just let me finish something and I ll call\nyou.',
                                      style:
                                          TextStyle(color: NowUIColors.white),
                                    )),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text('10:34 PM',
                                      style: TextStyle(
                                          color: NowUIColors.text,
                                          fontSize: 11.0)),
                                )
                              ],
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: const SizedBox(
                                height: 35,
                                width: 35,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/imgs/profile-img.jpg"),
                                  radius: 65.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: const SizedBox(
                                height: 35,
                                width: 35,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://raw.githubusercontent.com/creativetimofficial/public-assets/master/now-ui-pro-react-native/julie.jpg"),
                                  radius: 65.0,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 15.0),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        color: NowUIColors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(4.0))),
                                    child: const Text(
                                      'OK. Cool! See you!',
                                      style:
                                          TextStyle(color: NowUIColors.black),
                                    )),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text('10:35 PM',
                                      style: TextStyle(
                                          color: NowUIColors.text,
                                          fontSize: 11.0)),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 15.0),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 3,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        color: NowUIColors.primary,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(4.0))),
                                    child: const Text(
                                      'Bye bye',
                                      style:
                                          TextStyle(color: NowUIColors.white),
                                    )),
                                const Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text('10:36 PM',
                                      style: TextStyle(
                                          color: NowUIColors.text,
                                          fontSize: 11.0)),
                                )
                              ],
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: const SizedBox(
                                height: 35,
                                width: 35,
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage("assets/imgs/profile-img.jpg"),
                                  radius: 65.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        for (var i = 0; i < messages.length; i++)
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 15.0),
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                spreadRadius: 1,
                                                blurRadius: 3,
                                                offset: const Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            color: NowUIColors.primary,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(4.0))),
                                        child: Text(
                                          messages[i]['body']!,
                                          style: const TextStyle(
                                              color: NowUIColors.white),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: Text(messages[i]['time']!,
                                          style: const TextStyle(
                                              color: NowUIColors.text,
                                              fontSize: 11.0)),
                                    )
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: SizedBox(
                                    height: 35,
                                    width: 35,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          messages[i]['author_image']!),
                                      radius: 65.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                      ]),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 3,
                        offset:
                            const Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextField(
                    textInputAction: TextInputAction.send,
                    onSubmitted: (value) {
                      setState(() {
                        messages.add({
                          "body": value,
                          "time": "10:40 PM",
                          "author_image": "assets/imgs/profile-img.jpg"
                        });
                      });
                      _scrollController.animateTo(
                        0.0,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                      );
                      controller.text = "";
                    },
                    controller: controller,
                    style: const TextStyle(
                        color: NowUIColors.black, fontSize: 16.0),
                    cursorColor: NowUIColors.black,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: NowUIColors.white,
                      hintText: 'Message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 15.0),
                      prefixIcon: Material(
                          borderRadius: BorderRadius.circular(30.0),
                          child: const Icon(
                            Icons.camera_alt,
                            color: NowUIColors.black,
                            size: 22.0,
                          )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
