import 'package:flutter/material.dart';
import 'package:travel_app/constants/Theme.dart';

//widgets
import 'package:travel_app/widgets/navbar.dart';
import 'package:travel_app/widgets/slider-product.dart';
import 'package:travel_app/widgets/card-small.dart';

import 'package:travel_app/screens/product.dart';

class Category extends StatelessWidget {
  final String screenTitle;
  final List imgArray;
  final List suggestionsArray;

  const Category(
      {super.key,
      this.screenTitle = "Category",
      required this.imgArray,
      required this.suggestionsArray});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: screenTitle,
          backButton: true,
        ),
        backgroundColor: NowUIColors.bgColorScreen,
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              Container(
                // height: 700,
                padding: const EdgeInsets.only(top: 16.0),
                child: ProductCarousel(imgArray: imgArray),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardSmall(
                        img: suggestionsArray[0]["img"],
                        title: suggestionsArray[0]["title"],
                        tap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Product(
                                  title: suggestionsArray[0]['title'],
                                  urlImg: suggestionsArray[0]['img'],
                                ),
                              ));
                        }),
                    CardSmall(
                        img: suggestionsArray[1]["img"],
                        title: suggestionsArray[1]["title"],
                        tap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Product(
                                  title: suggestionsArray[1]['title'],
                                  urlImg: suggestionsArray[1]['img'],
                                ),
                              ));
                        }),
                  ],
                ),
              )
            ],
          )),
        ));
  }
}
