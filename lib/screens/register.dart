import 'package:flutter/material.dart';
import 'package:travel_app/constants/Theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_app/constants/printCus.dart';
import 'package:travel_app/controllers/user.dart';
import 'package:travel_app/firebaseservices.dart';
import 'package:get/get.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  void _handleGoogleSign() {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(_googleAuthProvider);
      UserController userController = Get.put(UserController());
      if (_user != null) {
        userController.setUser(_user);
      }
    } catch (error) {
      printDebug('error google sigin:', '$error');
    }
  }

  void _handleSignOut() {
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/imgs/register-bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: AlignmentDirectional.bottomEnd,
                        colors: [
                          Color.fromRGBO(44, 44, 44, 0.2),
                          Color.fromRGBO(224, 23, 3, 0.8),
                        ],
                      ),
                    ),
                    child: Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Column(
                          children: [
                            const Text(
                              'PS TRAVEL APP',
                              style: TextStyle(
                                color: NowUIColors.textWhite,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: OutlinedButton(
                                onPressed: _handleGoogleSign,
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(99.0),
                                    ),
                                  ),
                                  side: MaterialStateProperty.all<BorderSide>(
                                    const BorderSide(
                                      color: Color.fromRGBO(255, 255, 255, 0.6),
                                      width: 1.0,
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color.fromRGBO(255, 255, 255, 0.2),
                                  ),
                                ),
                                child: const Text(
                                  'Đăng nhập bằng Google',
                                  style:
                                      TextStyle(color: NowUIColors.textWhite),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: OutlinedButton(
                                onPressed: signInWithFacebook,
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(99.0),
                                    ),
                                  ),
                                  side: MaterialStateProperty.all<BorderSide>(
                                    const BorderSide(
                                      color: Color.fromRGBO(255, 255, 255, 0.6),
                                      width: 1.0,
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color.fromRGBO(255, 255, 255, 0.2),
                                  ),
                                ),
                                child: const Text(
                                  'Đăng nhập bằng Facebook',
                                  style:
                                      TextStyle(color: NowUIColors.textWhite),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
