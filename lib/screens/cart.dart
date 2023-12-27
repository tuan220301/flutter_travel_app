import 'package:flutter/material.dart';
import 'package:travel_app/constants/Theme.dart';
import 'package:travel_app/widgets/card-shopping-cart.dart';

//widgets
import 'package:travel_app/widgets/navbar.dart';
import 'package:travel_app/widgets/card-shopping.dart';

List<CardShopingCart> smallCards = [
  CardShopingCart(
      title: "We\'ll start with the basic and go ...",
      img:
          "https://images.unsplash.com/photo-1586423702505-b13505519074?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=750&amp;q=80"),
  CardShopingCart(
      title: "Harley Davidson motorcycle has a ...",
      img:
          "https://images.unsplash.com/photo-1558980395-be8a5fcb4251?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=751&amp;q=80"),
  CardShopingCart(
      title: "Whether is a beatiful one you have to ...",
      img:
          "https://images.unsplash.com/photo-1447752875215-b2761acb3c5d?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=750&amp;q=80"),
];

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<Map> shoppingCards = [
    {
      "body": "Discover What's New In Beauty And\nRec ...",
      "stock": true,
      "price": "180",
      "img":
          "https://images.unsplash.com/photo-1466150036782-869a824aeb25?fit=crop&w=1350&q=80",
    },
    {
      "body": "Carry the charm of New Orlean\nwith you ...",
      "stock": false,
      "price": "230",
      "img":
          "https://images.unsplash.com/photo-1464375117522-1311d6a5b81f?fit=crop&w=1050&q=80",
    },
    {
      "body": "Make the most of what you wear today with ...",
      "stock": false,
      "price": "140",
      "img":
          "https://images.unsplash.com/photo-1485120750507-a3bf477acd63?fit=crop&w=1050&q=80"
    }
  ];
  @override
  Widget build(BuildContext context) {
    num basketValue = 0;
    for (int i = 0; i < shoppingCards.length; i++) {
      basketValue += int.parse(shoppingCards[i]["price"]);
    }
    return Scaffold(
      appBar: Navbar(
        title: "Shopping Cart",
        backButton: true,
        rightOptions: false,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: true,
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  top: 30.0, left: 15.0, right: 15.0, bottom: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("Cart subtotal (${shoppingCards.length} items): ",
                          style: const TextStyle(
                            fontSize: 16,
                          )),
                      Text("\$$basketValue",
                          style: const TextStyle(
                              color: NowUIColors.error,
                              fontWeight: FontWeight.bold,
                              fontSize: 16))
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        // primary: NowUIColors.white,
                        backgroundColor: NowUIColors.info,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      onPressed: () {
                        // Respond to button press
                        Navigator.pushNamed(context, '/home');
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 12, bottom: 12),
                        child: Text(
                          "PROCEED TO CHECKOUT",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var i = 0; i < shoppingCards.length; i++)
                        Padding(
                            padding: const EdgeInsets.only(top: 32.0),
                            child: CardShopping(
                              body: shoppingCards[i]["body"],
                              stock: shoppingCards[i]["stock"],
                              price: shoppingCards[i]["price"],
                              img: shoppingCards[i]["img"],
                              deleteOnPress: () {
                                setState(() {
                                  shoppingCards.removeAt(i);
                                });
                              },
                            ))
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Customers who shopped for items in your cart also shopped for:",
                      style: TextStyle(
                          color: NowUIColors.text,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    height: 300.0,
                    child: ListView.builder(
                        itemCount: smallCards.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) =>
                            Column(
                              children: [
                                Column(
                                  children: [
                                    smallCards[index],
                                    SizedBox(
                                      width: 170.0,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          // primary: NowUIColors.white,
                                          backgroundColor: NowUIColors.info,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: const Padding(
                                            padding: EdgeInsets.only(
                                                left: 16.0,
                                                right: 16.0,
                                                top: 10,
                                                bottom: 10),
                                            child: Text("ADD TO CART",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12.0))),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        // primary: NowUIColors.white,
                        backgroundColor: NowUIColors.info,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      onPressed: () {},
                      child: const Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 12, bottom: 12),
                          child: Text("PROCEED TO CHECKOUT",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0))),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
