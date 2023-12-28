// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:travel_app/constants/Theme.dart';
import 'package:travel_app/constants/printCus.dart';
import 'package:travel_app/controllers/user.dart';
import 'package:travel_app/widgets/drawer.dart';
import 'package:travel_app/widgets/navbar.dart';

class View360Image extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  View360Image({Key? key});

  final UserController userController = Get.find();
  final RxInt selectedImageIndex =
      0.obs; // Observable variable for selected image index

  void handleChangeView() {
    // Handle view change
  }

  var listButton = <Map<String, dynamic>>[
    {
      'id': 1,
      'image': 'assets/imgs/Ut_dieu/image12.jpg',
      'title': 'Giới thiệu'
    },
    {'id': 2, 'image': 'assets/imgs/Ut_dieu/image10.jpg', 'title': 'Ẩm thực'},
    {
      'id': 3,
      'image': 'assets/imgs/Ut_dieu/image11.jpg',
      'title': 'Đờn ca tài tử'
    },
    {
      'id': 4,
      'image': 'assets/imgs/Ut_dieu/image9.jpg',
      'title': 'Hát cho nhau'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "Tham quan 360",
      ),
      backgroundColor: NowUIColors.bgColorScreen,
      drawer: NowDrawer(currentPage: "View360Image"),
      body: Stack(
        children: [
          Center(
            child: Obx(() {
              return PanoramaViewer(
                key:
                    UniqueKey(), // Add a key to properly manage the widget's state
                hotspots: [
                  Hotspot(
                    latitude: -41.41168320784198,
                    longitude: 61.46808179736491,
                    name: 'Description',
                    width: 100,
                    height: 50,
                    widget: Container(
                      width: 100,
                      height: 50,
                      color: Colors.blue,
                      child: Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () => handleChangeView(),
                          child: const Text(
                            'Quay lại',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                child: Image.asset(
                  listButton[selectedImageIndex.value]['image'],
                  fit: BoxFit.contain,
                ),
                onTap: (longitude, latitude, tilt) {
                  printDebug('Longitude', longitude);
                  printDebug('Latitude', latitude);
                },
              );
            }),
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
                  children: listButton.asMap().entries.map((entry) {
                    final index = entry.key;
                    final element = entry.value;
                    return SizedBox(
                      width: 120,
                      height: 120,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 80,
                            child: IconButton(
                              onPressed: () {
                                selectedImageIndex.value = index;
                              },
                              icon: Image.asset(
                                element['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            element['title'],
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
      ),
    );
  }
}
