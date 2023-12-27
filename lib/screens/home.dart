import 'package:firebase_auth/firebase_auth.dart';
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

class Home extends StatelessWidget {
  final userControll = Get.put(UserController());
  final urlListController = Get.put(ImageController());
  Home({super.key});
  List<String> imageList0 = [
    'assets/imgs/album-1.jpg',
    'assets/imgs/album-2.jpg',
    'assets/imgs/album-3.jpg',
    'assets/imgs/album-4.jpg',
  ];

  List<String> imageList1 = [
    'assets/imgs/img1.jpg',
    'assets/imgs/img2.jpg',
    'assets/imgs/img3.jpg',
    'assets/imgs/img4.jpg'
  ];
  List<String> imageList2 = [
    'assets/imgs/img5.jpg',
    'assets/imgs/img6.jpg',
    'assets/imgs/img7.jpg',
    'assets/imgs/img8.jpg',
  ];
  List<String> imageList3 = [
    'assets/imgs/img9.jpg',
    'assets/imgs/img10.jpg',
    'assets/imgs/img11.jpg',
    'assets/imgs/img12.jpg',
  ];
  void handleChangeListImage(int index) {
    printDebug('index', index);
    switch (index) {
      case 0:
        urlListController.setUrlList(imageList0);
        break;
      case 1:
        urlListController.setUrlList(imageList1);
        break;
      case 2:
        urlListController.setUrlList(imageList2);
        break;
      case 3:
        urlListController.setUrlList(imageList3);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "Home",
        // searchBar: false,
        // categoryOne: "Trending",
        // categoryTwo: "Fashion",
      ),
      backgroundColor: NowUIColors.bgColorScreen,
      // key: _scaffoldKey,
      drawer: NowDrawer(currentPage: "Home"),
      body: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // if (userControll.user.value!.email != null)
              //   Text('Welcome, ${userControll.user.value!.email}!')
              // else
              //   const Text('Hello, guest!'),
              const SizedBox(
                height: 10,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.7,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 4 / 3, // Adjust the aspect ratio as needed
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 600),
                  viewportFraction: 0.8,
                ),
                // ignore: invalid_use_of_protected_member
                items: urlListController.urlList.value.map((imageUrl) {
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
                height: 90,
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      imageList0.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(999),
                          child: TextButton(
                            onPressed: () => handleChangeListImage(index),
                            child: Image.asset(
                              imageList0[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
