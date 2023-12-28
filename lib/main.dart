import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/firebase_options.dart';
// screens
import 'package:travel_app/screens/home.dart';
import 'package:travel_app/screens/profile.dart';
import 'package:travel_app/screens/register.dart';
import 'package:travel_app/screens/view_360_img.dart';
import 'package:travel_app/widgets/authpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthPage();
  }
}
