import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/firebase_options.dart';
// screens
import 'package:travel_app/screens/home.dart';
import 'package:travel_app/screens/profile.dart';
import 'package:travel_app/screens/register.dart';
import 'package:travel_app/screens/view_360_img.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
