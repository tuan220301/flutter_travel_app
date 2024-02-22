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
  RxNum selectedButtonIndex = RxNum(0);

  void handleChangeView() {
    // Handle view change
  }
  void onChange360Image(index) {
    if (index != selectedButtonIndex.value) {
      SetView360Controll.setView(listScrollButtonBottom[index]);
      selectedButtonIndex.value = index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Tham quan 360",
        ),
        backgroundColor: NowUIColors.bgColorScreen,
        drawer: NowDrawer(currentPage: "View360Image"),
        body: Obx(() {
          printDebug('selected btn: ', selectedButtonIndex.value);
          return Stack(
            children: [
              Center(
                child: KeyedSubtree(
                  key: UniqueKey(),
                  child: CustomPanoramaViewer(
                    imagePath:
                        // ignore: invalid_use_of_protected_member
                        SetView360Controll.viewShow.value['image_360_def'],
                    latitude: -42.366601616265605,
                    longitude: 25.81805741670187,
                    ListHotPot:
                        // ignore: invalid_use_of_protected_member
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
                  height: 130,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                          listScrollButtonBottom.asMap().entries.map((entry) {
                        final index = entry.key;
                        final element = entry.value;
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            width: 145,
                            height: 160,
                            margin: const EdgeInsets.all(1),
                            child: OutlinedButton(
                              onPressed: () => onChange360Image(index),
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                side: BorderSide(
                                    width: 2,
                                    color: index == selectedButtonIndex.value
                                        ? NowUIColors.active
                                        : NowUIColors.input),
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: 145,
                                    height: 60,
                                    child: Image.asset(
                                      element['image'].toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    element['title'].toString(),
                                    style: const TextStyle(
                                        fontSize: 12, color: NowUIColors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          );
        }));
  }
}
