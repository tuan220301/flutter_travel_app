import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:travel_app/constants/Theme.dart';
import 'package:travel_app/constants/printCus.dart';
import 'package:travel_app/widgets/body_modal_bottom.dart';

// import 'package:travel_app/screens/category.dart';
import 'package:travel_app/widgets/drawer.dart';

//widgets
import 'package:travel_app/widgets/navbar.dart';
// import 'package:travel_app/widgets/card-category.dart';

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  // _getCurrentPage(activeTag) {
  //   setState(() {
  //     currentTag = activeTag;
  //     print('currentTag is $currentTag');
  //   });
  // }

  // @override
  // void initState() {
  //   currentTag = tags[0];
  //   super.initState();
  // }
  var listDataTravelScreen = [
    {
      'id': 1,
      'title': 'KDL sinh thái Miệt vườn Út Diệu',
      'img': 'assets/imgs/Ut_dieu/image12.jpg',
      'phone': '0336019765',
      'location': 'Ấp Sơn Phú 2A, xã Tân Thành, TP Ngã Bảy, Hậu Giang',
      'lat': 9.862334450359905,
      'long': 105.8305833,
      'content':
          'Khu du lịch sinh thái Miệt vườn Út Diệu là nơi du khách có thể lựa chọn tìm đến để trải nghiệm các món ăn đặc sản ...',
      'imgDes': 'assets/imgs/Ut_dieu/image10.jpg',
      'header':
          'Khu du lịch sinh thái Miệt vườn Út Diệu là nơi du khách có thể lựa chọn tìm đến để trải nghiệm các món ăn đặc sản miền tây và thưởng thức âm nhạc truyền thống với chương trình "Hát với nhau đàn ca tài tử" được tổ chức hàng tuần.',
      'body':
          'Khu du lịch có diện tích hơn 1ha, được trồng nhiều loại cây ăn trái như mít, cam, chôm chôm, xoài,... Ngoài ra xen kẻ trong vườn còn bố trí nhiều cảnh trí đẹp và bắt mắt để du khách có thể tham gia checkin. Đến với Út Diệu, du khách có thể thưởng thức những món ăn đặc sản như: Bánh xèo, chim trĩ (xào bầu, kho dừa, khìa, nướng, nấu cháo,...), gà, ếch,... Khu du lịch có nhận đặt món trước theo số lượng khách yêu cầu. Bên cạnh đó, khu dịch còn kết hợp trưng bày "Rượu Giấc Ng7" là đặc sản độc quyền của Ngã Bảy đã đặt OCOOP 4 Sao và khách tham quan có thể mua về làm quà kỷ niệm.',
      'footer':
          'Tại đây mở cửa đặt món quanh năm để phục vụ nhu cầu tham quan, giải trí của du khách và thời điểm khách đến đông nhất là dịp cuối tuần và các dịp nghỉ lễ trong năm.'
    },
    {
      'id': 2,
      'title': 'Vườn dâu Út Ngân',
      'img': 'assets/imgs/Ut_ngan/title.jpg',
      'phone': '0919284344',
      'location': '294 Ấp Mái Dầm, Đại Thành, Ngã Bảy, Hậu Giang, Việt Nam',
      'lat': 9.82237,
      'long': 105.82895,
      'content':
          'Vườn dâu Út Ngân nằm bên con Kênh Cái Côn - là một trong 7 con kênh làm nên địa danh Ngã Bảy...',
      'imgDes': 'assets/imgs/Ut_ngan/img38.jpg',
      'header':
          'Vườn dâu Út Ngân nằm bên con Kênh Cái Côn - là một trong 7 con kênh làm nên địa danh Ngã Bảy. Vườn dâu có diện tích khoảng 1ha với hơn 200 gốc dâu, với các loại dâu là dâu xanh, dâu vàng và dâu bòn bon.',
      'body':
          'Đến thăm vườn dâu vào dịp cuối tháng 2 và đầu tháng 3 âm lịch, du lịch sẽ được đắm chìm trong khung cảnh vườn dâu trĩu quả và ngập tràn trong sắc xanh và vàng của quả. Đây cũng là thời điểm khách đến vườn tham quan nhiều nhất.Du khách có thể tự do tham quan, chụp ảnh checkin, tự do hái trái và thưởng thức trái ngay tại vườn.',
      'footer':
          'Ngoài ra, vườn dâu Út Ngân còn bố trí các tum che mát để khách có thể ghé lại nghỉ ngơi và thưởng thức các món ăn dân dã miền tây tại đây như: cá lóc nướng chui, bánh xèo, tép chiên bột, gỏi gà, lươn, ếch,... và các món ăn theo yêu cầu của khách.'
    },
    {
      'id': 3,
      'title': 'Vườn hoa Đại Thành',
      'img': 'assets/imgs/Dai_thanh/img28.jpg',
      'phone': '0939322279',
      'location': 'Nhà văn hóa xã Đại Thành, TP Ngã Bảy, Hậu Giang',
      'lat': 9.830077998142583,
      'long': 105.82776838650895,
      'content':
          'Vườn hoa thuộc dự án của hợp tác xã Đại Thành. Vườn hoa Đại Thành là nơi sản xuất hoa để bán Tết, đồng thời là nơi tham quan ...',
      'imgDes': 'assets/imgs/Dai_thanh/img29.jpg',
      'header':
          'Vườn hoa thuộc dự án của hợp tác xã Đại Thành. Vườn hoa Đại Thành là nơi sản xuất hoa để bán Tết, đồng thời là nơi tham quan, chụp ảnh lưu niệm cho du khách và bà con tại xã.',
      'body':
          'Vườn hoa chủ yếu hoạt động vào dịp Tết, còn ngày thường thì vườn hoa phục vụ các dịch vụ ăn uống, giải khát như một quán ăn gia đình. Vào dịp Tết thì vườn hoa sản xuất với số lượng trên 30.000 chậu hoa. Dự kiến các hoạt động Tết: thi nấu bánh tét, hoạt động trò chơi dân gian, lễ hội bánh dân gian,... vào ngày 25 26 27 tết (dự kiến) ',
      'footer':
          'Vườn hoa có quy mô khá lớn tại xã Đại Thành. Vườn hoa được bày trí khá bắt mắt và mang tính nghệ thuật cao. Du khách có thể tham quan chụp hình với vườn hoa ngát hương và đầy màu sắc. Đồng thời mua hoa chậu trang trí Tết với giá cả phải chăng, đẹp và lạ.'
    },
    {
      'id': 4,
      'title': 'Vườn chôm chôm 9 Hùng',
      'img': 'assets/imgs/9_hung/img5.jpg',
      'phone': '0949353898',
      'location': '390 ấp Đông An 2, xã Tân Thành, thành phố Ngã Bảy',
      'lat': 9.856227054400604,
      'long': 105.85241185626924,
      'content':
          'Vườn chôm chôm Chín Hùng tọa lạc gần gần khu dân cư vượt lũ Cái Côn - cầu Cống Đá. Vườn có diện tích khoảng 3ha, ...',
      'imgDes': 'assets/imgs/9_hung/img11.jpg',
      'header':
          'Vườn chôm chôm Chín Hùng tọa lạc gần gần khu dân cư vượt lũ Cái Côn - cầu Cống Đá. Vườn có diện tích khoảng 3ha, được trồng 3 loại chôm chôm là chôm chôm thường, chôm chôm nhãn và chôm chôm thái, cùng các loại trái cây khác như măng cục, sầu riêng, mít,...',
      'body':
          'Vườn chôm chôm Chín Hùng đã mở cửa đón khách tham quan từ nhiều năm nay – 9 năm. Vườn sẽ bắt đầu mở cửa đón khách tham quan vào khoảng tháng 7 âm lịch.Đến với vườn chôm chôm du khách sẽ được thỏa sức tham quan, chụp ảnh, tự do hái và ăn ngay những quả tươi ngon và mọng nước ngay tại vượn. Thêm vào đó còn có các dịch vụ ăn uống, giải trí kèm theo như chào xuồng, cá hát,... để phục vụ nhu cầu đa dạng của khách.',
      'footer':
          'Khách đến tham quan có thể đặt món hẹn trước để chủ vườn chuẩn bị trước và đỡ mất thời gian chờ đợi, những món ăn ngon dân dã có thể kể đến như cá lóc quay thùng, bánh xèo, cháo gà, lẩu gà lá chanh,...Hàng năm vườn đều thu hút khá đông lượt khách đến tham quan, bình quân từ 100 đến 200 lượt khách mỗi ngày.'
    },
    {
      'id': 5,
      'title': 'Vườn chôm chôm 7 Liễu',
      'img': 'assets/imgs/7_lieu/img1.jpg',
      'phone': '0987807274 - 0375558069',
      'location':
          'Số 422, ấp Đông An 2, xã Tân Thành, Thành phố Ngã Bảy, Hậu Giang',
      'lat': 9.852239209433465,
      'long': 105.85759640722527,
      'content':
          'Vườn chôm chôm 7 Liễu là nơi thích hợp cho du khách tìm đến địa điểm có kết hợp tham quan, vui chơi giải trí và ăn uống ...',
      'imgDes': 'assets/imgs/7_lieu/img4.jpg',
      'header':
          'Vườn chôm chôm 7 Liễu là nơi thích hợp cho du khách tìm đến địa điểm có kết hợp tham quan, vui chơi giải trí và ăn uống. Vườn có diện tích khoảng hơn 2ha, vườn trồng 2 loại chôm chôm chính là chôm chôm thường và chôm chôm Tiến Cường.',
      'body':
          'Du khách vào vườn sẽ được tự hái và thưởng thức chôm chôm tươi mát, chín mọng tại vườn. Để phục vụ nhu cầu "sống ảo", nhà vườn còn đầu tư trang tiểu cảnh đẹp mang phong cách dân dã cho khách tham quan chụp ảnh. Ngoài ra khi đi với nhóm, tập thể, du khách còn có thể trải nghiệm các trò chơi mang đậm chất miền tây sông nước như: Đi cầu khỉ, đu dây, đi cầu lắc, bắt cá xìn (có thể tự nướng tại vườn với giá bình dân), bơi xuồng...Sau khi tham quan và vui chơi mệt mỏi, du khách có thẻ chọn ghé lại võng, chồi để nghỉ ngơi và ăn uống. Vườn có nhận đặt tiệc liên hoan, hội thảo, họp mặt, các món ăn đều là đặc sản miền tây độc lạ, thơm ngon. Vườn có trang bị thêm dàn loa kẹo kéo cho khách yêu thích văn nghệ và muốn khuấy động không khí.',
      'footer':
          'Với những đoàn khách đi bằng xe ô tô, vườn có hỗ trợ đò đưa rước miễn phí đến tận nơi, và nhờ đó du khách có thêm trải nghiệm cảnh sông nước miền Tây. Vườn mở cửa đón khách vào tháng 5  đến cuối tháng 6 âm lịch hằng năm để thưởng thức chôm chôm vào mùa vừa ngon vừa đẹp'
    },
    {
      'id': 6,
      'title': 'Vườn chôm chôm Thanh Thuyền',
      'img': 'assets/imgs/Thanh_thuyen/img6.jpg',
      'phone': '0979838860',
      'location': 'số 490, ấp Đông An 2, xã Tân Thành, TP Ngã Bảy, Hậu Giang',
      'lat': 9.861692972627218,
      'long': 105.86110074232735,
      'content':
          'Vườn chôm chôm Thanh Thuyền hay còn gọi là vượn Út Ốm. Đường vào vườn Thanh Thuyền khá dễ đi. Vườn rộng 3ha, chôm chôm ...',
      'imgDes': 'assets/imgs/Thanh_thuyen/img7.jpg',
      'header': 'Vườn chôm chôm Thanh Thuyền hay còn gọi là vượn Út Ốm.',
      'body':
          'Đường vào vườn Thanh Thuyền khá dễ đi. Vườn rộng 3ha, chôm chôm vào mùa đỏ rực cả mảnh vườn. Khách vào vườn được tự hái ăn chôm chôm miễn phí. Ngoài ra còn được trải nghiệm bơi xuồng dọc theo con kênh tại vườn, chụp ảnh dưới nắng xen kẽ lá lung linh. Vườn có những chồi lá cho khách ăn uống, nghỉ ngơi tại vườn. Các địa điểm nghỉ ngơi rất thoáng mát tạo sự yên bình cho du khách trốn đi những tấp nập của cuộc sống. ',
      'footer': 'Khách đi xe ô tô có bến gửi xe , lộ lớn đi được xe 4 chỗ 7 chỗ'
    },
    {
      'id': 7,
      'title': 'Làng nghề làm than',
      'img': 'assets/imgs/Lang_nghe_lam_than/img1.jpg',
      'phone': '',
      'location': 'xã Tân Thành, TP Ngã Bảy, Hậu Giang',
      'lat': 9.861956881431261,
      'long': 105.85677199574562,
      'content':
          'Làng nghề làm than gồm nhiều hộ gia đình làm than truyền thống bằng gỗ tươi từ cây tràm, dước, bạch đàng,... ',
      'imgDes': 'assets/imgs/Lang_nghe_lam_than/img7.jpg',
      'header':
          'Làng nghề làm than gồm nhiều hộ gia đình làm than truyền thống bằng gỗ tươi từ cây tràm, dước, bạch đàng,...',
      'body':
          'Qua quá trình thực hiện, than được hình thành và đưa vào phục vụ đời sống người dân trong và ngoài địa bàn. Có thể nói làng nghề mang lại  hiệu quả kinh tế cho địa phương khi tạo thêm công ăn việc làm cho bà con.',
      'footer':
          'Đồng thời, không gian của các hộ làm nghề than có những cảnh quan rất thú vị với nét cổ xưa đặc biệt, là điểm tham quan cho du khách hiểu thêm về đặc điểm của địa phương. '
    },
  ];

  void openCustomBottomSheet(content) {
    printDebug('content', content);
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        builder: (BuildContext context) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.90,
              child: BodyBottomSheet(
                body: content['body'],
                footer: content['footer'],
                header: content['header'],
                img: content['img'],
                imgDes: content['imgDes'],
                title: content['title'],
                location: content['location'],
                phone: content['phone'],
                lat: content['lat'],
                long: content['long'],
                closeModal: () {
                  Navigator.pop(context);
                },
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    printDebug('data: ', listDataTravelScreen[0]['title']);
    return Scaffold(
        appBar: Navbar(
          title: "Khám phá",
        ),
        backgroundColor: NowUIColors.bgColorScreen,
        drawer: NowDrawer(currentPage: "Trending"),
        // extendBodyBehindAppBar: true,
        body: Container(
            padding: const EdgeInsets.only(left: 0.0, right: 0.0),
            margin: const EdgeInsets.only(top: 10),
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.85,
                enlargeCenterPage: true,
                autoPlay: false,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                viewportFraction: 0.85,
              ),
              items: listDataTravelScreen.map((img) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: 400,
                      margin: const EdgeInsets.symmetric(horizontal: 1.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(img['img'] as String),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          // Positioned widget to place the text at the bottom
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              // color: Colors.black.withOpacity(0.7),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(
                                    0.8), // Background color for text
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      8.0), // Border radius at the bottom-left corner
                                  bottomRight: Radius.circular(
                                      8.0), // Border radius at the bottom-right corner
                                ),
                              ),

                              child: Column(
                                children: [
                                  Text(
                                    img['title'] as String,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    img['content'] as String,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: NowUIColors.active),
                                      onPressed: () =>
                                          openCustomBottomSheet(img),
                                      child: const Text(
                                        'Xem chi tiết',
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            )));
  }
}
