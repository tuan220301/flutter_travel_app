import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:travel_app/constants/Theme.dart';

class ProductCarousel extends StatefulWidget {
  final List imgArray;

  const ProductCarousel({
    // Key key,
    required this.imgArray,
  });

  @override
  _ProductCarouselState createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  // ignore: unused_field
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.imgArray
          .map((item) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                            blurRadius: 8,
                            spreadRadius: 0.3,
                            offset: Offset(0, 3))
                      ]),
                      child: AspectRatio(
                        aspectRatio: 2 / 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            item["img"]!,
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                      children: [
                        Text(item["price"]!,
                            style: const TextStyle(
                                fontSize: 16, color: NowUIColors.text)),
                        Text(item["title"]!,
                            style: const TextStyle(
                                fontSize: 32, color: NowUIColors.text)),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 8),
                          child: Text(
                            item["description"]!,
                            style: const TextStyle(
                                fontSize: 16, color: NowUIColors.muted),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ))
          .toList(),
      options: CarouselOptions(
          height: 530,
          autoPlay: false,
          enlargeCenterPage: false,
          aspectRatio: 4 / 4,
          enableInfiniteScroll: false,
          initialPage: 0,
          // viewportFraction: 1.0,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          }),
    );
  }
}
