import 'package:flutter/material.dart';
import 'package:travel_app/constants/Theme.dart';

class BodyBottomSheet extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const BodyBottomSheet(
      {this.title = "Placeholder Title",
      this.img = "https://via.placeholder.com/250",
      this.header = '',
      this.body = '',
      this.imgDes = '',
      this.footer = '',
      this.location = '',
      this.phone = ''});

  final String img;
  final String title;
  final String header;
  final String imgDes;
  final String body;
  final String footer;
  final String location;
  final String phone;

  static void defaultFunc() {
    print("the function works!");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView(children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(
            text: 'Số điện thoại: ',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
            children: <TextSpan>[
              TextSpan(
                text: phone,
                style: const TextStyle(fontSize: 14, color: NowUIColors.active),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        RichText(
          text: TextSpan(
            text: 'Địa chỉ: ',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
            children: <TextSpan>[
              TextSpan(
                text: location,
                style: const TextStyle(fontSize: 14, color: NowUIColors.info),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          header,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(
          height: 10,
        ),
        Image(
          image: AssetImage(img),
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          body,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(
          height: 10,
        ),
        Image(
          image: AssetImage(imgDes),
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          footer,
          style: const TextStyle(fontSize: 14),
        )
      ]),
    );
  }
}
