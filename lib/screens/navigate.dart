import 'package:flutter/material.dart';
import 'package:travel_app/screens/home.dart';
import 'package:travel_app/screens/profile.dart';
import 'package:travel_app/screens/register.dart';
import 'package:travel_app/screens/view_360_img.dart';

class NavigateScreen extends StatelessWidget {
  const NavigateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Now UI PRO Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: MaterialApp(
        title: 'Now UI PRO Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Montserrat'),
        initialRoute: '/account',
        routes: <String, WidgetBuilder>{
          "/account": (BuildContext context) => const Register(),
          "/home": (BuildContext context) => Home(),
          "/profile": (BuildContext context) => const Profile(),
          "/360viewer": (BuildContext context) => const View360Image(),
        },
      ),
    );
  }
}
