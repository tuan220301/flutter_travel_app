// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app/constants/Theme.dart';
import 'package:travel_app/constants/data.dart';
import 'package:travel_app/constants/printCus.dart';
import 'package:travel_app/controllers/setView360.dart';
import 'package:travel_app/widgets/PanoramaViewer.dart';
import 'package:travel_app/widgets/drawer.dart';
import 'package:travel_app/widgets/navbar.dart';

class View360Image extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  View360Image({Key? key});
  // ignore: non_constant_identifier_names
  final SetView360Controll = Get.put(SetView360Controller());

  void handleChangeView() {
    // Handle view change
  }
  void onChange360Image(index) {
    // printDebug('index: ', index);
    // printDebug('image: ', listScrollButtonBottom[index]['image']);
    SetView360Controll.setView(listScrollButtonBottom[index]);
  }

  @override
  Widget build(BuildContext context) {
    printDebug('360 img', SetView360Controll.viewShow.value['image_360_def']);
    return Scaffold(
        appBar: Navbar(
          title: "Tham quan 360",
        ),
        backgroundColor: NowUIColors.bgColorScreen,
        drawer: NowDrawer(currentPage: "View360Image"),
        body: Obx(() => Stack(
              children: [
                Center(
                  child: KeyedSubtree(
                    key: UniqueKey(),
                    child: CustomPanoramaViewer(
                      imagePath:
                          SetView360Controll.viewShow.value['image_360_def'],
                      latitude: -42.366601616265605,
                      longitude: 25.81805741670187,
                      ListHotPot:
                          SetView360Controll.viewShow.value['list_image_360'],
                      onTap: handleChangeView,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 100,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:
                            listScrollButtonBottom.asMap().entries.map((entry) {
                          final index = entry.key;
                          final element = entry.value;
                          return SizedBox(
                            width: 145,
                            height: 120,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 145,
                                  height: 66,
                                  child: IconButton(
                                    onPressed: () => onChange360Image(index),
                                    icon: Image.asset(
                                      element['image'].toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  element['title'].toString(),
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
