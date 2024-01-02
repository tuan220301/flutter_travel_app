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

// ignore: must_be_immutable
class Home extends StatelessWidget {
  final userControll = Get.put(UserController());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final urlListController = Get.put(ImageController());
  RxInt indexListImg = 0.obs;
  Home({super.key});
  var imageList = [
    {
      'id': '1',
      'listImg': [
        'assets/imgs/Ut_dieu/image1.jpg',
        'assets/imgs/Ut_dieu/image2.jpg',
        'assets/imgs/Ut_dieu/image3.jpg',
        'assets/imgs/Ut_dieu/image4.jpg',
        'assets/imgs/Ut_dieu/image5.jpg',
        'assets/imgs/Ut_dieu/image6.jpg',
        'assets/imgs/Ut_dieu/image7.jpg',
        'assets/imgs/Ut_dieu/image8.jpg',
        'assets/imgs/Ut_dieu/image9.jpg',
        'assets/imgs/Ut_dieu/image10.jpg',
        'assets/imgs/Ut_dieu/image11.jpg',
        'assets/imgs/Ut_dieu/image12.jpg',
      ]
    },
    {
      'id': '2',
      'listImg': [
        'assets/imgs/Dai_thanh/img1.jpg',
        'assets/imgs/Dai_thanh/img2.jpg',
        'assets/imgs/Dai_thanh/img3.jpg',
        'assets/imgs/Dai_thanh/img4.jpg',
        'assets/imgs/Dai_thanh/img5.jpg',
        'assets/imgs/Dai_thanh/img6.jpg',
        'assets/imgs/Dai_thanh/img7.jpg',
        'assets/imgs/Dai_thanh/img8.jpg',
        'assets/imgs/Dai_thanh/img9.jpg',
        'assets/imgs/Dai_thanh/img10.jpg',
        'assets/imgs/Dai_thanh/img11.jpg',
        'assets/imgs/Dai_thanh/img12.jpg',
      ]
    },
    {
      'id': '3',
      'listImg': [
        'assets/imgs/Ut_ngan/img1.jpg',
        'assets/imgs/Ut_ngan/img2.jpg',
        'assets/imgs/Ut_ngan/img3.jpg',
        'assets/imgs/Ut_ngan/img4.jpg',
        'assets/imgs/Ut_ngan/img5.jpg',
        'assets/imgs/Ut_ngan/img6.jpg',
        'assets/imgs/Ut_ngan/img7.jpg',
        'assets/imgs/Ut_ngan/img8.jpg',
        'assets/imgs/Ut_ngan/img9.jpg',
        'assets/imgs/Ut_ngan/img10.jpg',
        'assets/imgs/Ut_ngan/img11.jpg',
        'assets/imgs/Ut_ngan/img12.jpg',
      ]
    }
  ];

  var listButton = <Map<String, dynamic>>[
    {'id': 1, 'image': 'assets/imgs/Ut_dieu/image12.jpg', 'title': 'Út Diệu'},
    {'id': 2, 'image': 'assets/imgs/Ut_dieu/image11.jpg', 'title': 'Đại Thành'},
    {'id': 3, 'image': 'assets/imgs/Ut_dieu/image9.jpg', 'title': 'Út Ngân'},
  ];

  void handleChangeListImage(ele) {
    printDebug('ele', ele);
    indexListImg.value = ele['id'] - 1;
    printDebug('indexListImg.value', indexListImg.value);
  }

  @override
  Widget build(BuildContext context) {
    // if (_auth.currentUser != null) {
    //   printDebug('user in home', _auth.currentUser);
    // } else {
    //   printDebug('user in home', 'null');
    // }
    return Scaffold(
      appBar: Navbar(
        title: "Home",
      ),
      backgroundColor: NowUIColors.bgColorScreen,
      drawer: NowDrawer(currentPage: "Home"),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Obx(() {
            return CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.7,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 1, // Adjust the aspect ratio as needed
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                // autoPlayAnimationDuration: const Duration(milliseconds: 600),
                viewportFraction: 0.8,
              ),
              // ignore: invalid_use_of_protected_member
              items:
                  (imageList[indexListImg.value]['listImg'] as List<String>? ??
                          [])
                      .map((imageUrl) {
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
            );
          }),
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
                            onPressed: () => handleChangeListImage(element),
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
