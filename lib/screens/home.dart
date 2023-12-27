import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travel_app/constants/Theme.dart';
import 'package:travel_app/constants/printCus.dart';
import 'package:travel_app/controllers/user.dart';

//widgets
import 'package:travel_app/widgets/navbar.dart';
import 'package:travel_app/widgets/drawer.dart';

class ImageController extends GetxController {
  RxList urlList = [
    'assets/imgs/album-1.jpg',
    'assets/imgs/album-2.jpg',
    'assets/imgs/album-3.jpg',
    'assets/imgs/album-4.jpg',
  ].obs;

  void setUrlList(List list) {
    urlList.value = list;
  }
}

// ignore: must_be_immutable
class Home extends StatelessWidget {
  final userControll = Get.put(UserController());
  // final urlListController = Get.put(ImageController());
  Home({super.key});
  List<String> imageList0 = [
    'assets/imgs/Ut_dieu/image1.jpg',
    'assets/imgs/Ut_dieu/image2.jpg',
    'assets/imgs/Ut_dieu/image3.jpg',
    'assets/imgs/Ut_dieu/image4.jpg',
  ];

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

  void handleChangeListImage(int index) {
    printDebug('index', index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "Home",
      ),
      backgroundColor: NowUIColors.bgColorScreen,
      drawer: NowDrawer(currentPage: "Home"),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.7,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 1, // Adjust the aspect ratio as needed
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 600),
              viewportFraction: 0.8,
            ),
            // ignore: invalid_use_of_protected_member
            items: imageList0.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: 400,
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 120,
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: listButton.map((element) {
                  return SizedBox(
                    width: 120,
                    height: 120,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 80,
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset(element['image'],
                                fit: BoxFit.cover),
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
          )
        ],
      ),
    );
  }
}
