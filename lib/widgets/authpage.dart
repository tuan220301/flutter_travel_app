import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/home.dart';
import 'package:travel_app/screens/profile.dart';
import 'package:travel_app/screens/register.dart';
import 'package:travel_app/screens/travel.dart';
import 'package:travel_app/screens/view_360_img.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patsoft',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(
              title: 'Patsoft',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: 'Montserrat'),
              initialRoute: '/home',
              routes: <String, WidgetBuilder>{
                "/account": (BuildContext context) => const Register(),
                "/home": (BuildContext context) => Home(),
                "/profile": (BuildContext context) => const Profile(),
                "/360viewer": (BuildContext context) => View360Image(),
                "/travel": (BuildContext context) => const Trending(),
              },
            );
          } else {
            return const Register();
          }
        },
      ),
    );
  }
}
