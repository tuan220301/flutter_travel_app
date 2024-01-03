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
  RxInt selectedButton = 1.obs;
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
    },
    {
      'id': '4',
      'listImg': [
        'assets/imgs/Thanh_thuyen/img1.jpg',
        'assets/imgs/Thanh_thuyen/img2.jpg',
        'assets/imgs/Thanh_thuyen/img3.jpg',
        'assets/imgs/Thanh_thuyen/img4.jpg',
        'assets/imgs/Thanh_thuyen/img5.jpg',
        'assets/imgs/Thanh_thuyen/img6.jpg',
        'assets/imgs/Thanh_thuyen/img7.jpg',
      ]
    },
    {
      'id': '5',
      'listImg': [
        'assets/imgs/9_hung/img1.jpg',
        'assets/imgs/9_hung/img2.jpg',
        'assets/imgs/9_hung/img3.jpg',
        'assets/imgs/9_hung/img4.jpg',
        'assets/imgs/9_hung/img5.jpg',
        'assets/imgs/9_hung/img6.jpg',
        'assets/imgs/9_hung/img7.jpg',
        'assets/imgs/9_hung/img8.jpg',
        'assets/imgs/9_hung/img9.jpg',
        'assets/imgs/9_hung/img10.jpg',
      ]
    },
    {
      'id': '6',
      'listImg': [
        'assets/imgs/7_lieu/img1.jpg',
        'assets/imgs/7_lieu/img2.jpg',
        'assets/imgs/7_lieu/img3.jpg',
        'assets/imgs/7_lieu/img4.jpg',
        'assets/imgs/7_lieu/img5.jpg',
        'assets/imgs/7_lieu/img6.jpg',
        'assets/imgs/7_lieu/img7.jpg',
        'assets/imgs/7_lieu/img8.jpg',
      ]
    },
    {
      'id': '7',
      'listImg': [
        'assets/imgs/Lang_nghe_lam_than/img1.jpg',
        'assets/imgs/Lang_nghe_lam_than/img2.jpg',
        'assets/imgs/Lang_nghe_lam_than/img3.jpg',
        'assets/imgs/Lang_nghe_lam_than/img4.jpg',
        'assets/imgs/Lang_nghe_lam_than/img5.jpg',
        'assets/imgs/Lang_nghe_lam_than/img6.jpg',
        'assets/imgs/Lang_nghe_lam_than/img7.jpg',
      ]
    },
  ];
  var listButton = <Map<String, dynamic>>[
    {
      'id': 1,
      'image': 'assets/imgs/Ut_dieu/image12.jpg',
      'title': 'KDL sinh thái Út Diệu'
    },
    {
      'id': 2,
      'image': 'assets/imgs/Dai_thanh/title.jpg',
      'title': 'Làng hoa Đại Thành'
    },
    {
      'id': 3,
      'image': 'assets/imgs/Ut_ngan/title.jpg',
      'title': 'Vườn dâu Út Ngân'
    },
    {
      'id': 4,
      'image': 'assets/imgs/Thanh_thuyen/title.jpg',
      'title': 'Chôm chôm Thanh Thuyền'
    },
    {
      'id': 5,
      'image': 'assets/imgs/9_hung/img11.jpg',
      'title': 'Chôm chôm 9 Hùng'
    },
    {
      'id': 6,
      'image': 'assets/imgs/7_lieu/img1.jpg',
      'title': 'Chôm chôm 7 Liễu'
    },
    {
      'id': 7,
      'image': 'assets/imgs/Lang_nghe_lam_than/img1.jpg',
      'title': 'Làng nghê làm than'
    },
  ];

  void handleChangeListImage(ele) {
    printDebug('ele', ele);
    indexListImg.value = ele['id'] - 1;
    printDebug('indexListImg.value', indexListImg.value);
    selectedButton.value = ele['id'];
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
        title: "Trang chủ",
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
                height: MediaQuery.of(context).size.height * 0.68,
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
          Obx(
            () => Container(
              height: 130,
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: listButton.map((element) {
                    return Container(
                      width: 120,
                      height: 130,
                      margin: const EdgeInsets.all(1),
                      child: OutlinedButton(
                        onPressed: () => handleChangeListImage(element),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              width: 1,
                              color: element['id'] == selectedButton.value
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
                              height: 80,
                              child: Image.asset(element['image'],
                                  fit: BoxFit.cover),
                            ),
                            Text(
                              element['title'],
                              style: const TextStyle(
                                  fontSize: 12, color: NowUIColors.black),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
