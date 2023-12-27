import 'package:flutter/material.dart';
import 'package:travel_app/constants/Theme.dart';

//widgets
import 'package:travel_app/widgets/navbar.dart';

class NotificationsSettings extends StatefulWidget {
  const NotificationsSettings({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationsSettingsState createState() => _NotificationsSettingsState();
}

class _NotificationsSettingsState extends State<NotificationsSettings> {
  late bool switchValueOne;
  late bool switchValueTwo;
  late bool switchValueThree;
  late bool switchValueFour;

  @override
  void initState() {
    setState(() {
      switchValueOne = false;
      switchValueTwo = false;
      switchValueThree = false;
      switchValueFour = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "Notifications Settings",
        backButton: true,
        rightOptions: false,
      ),
      backgroundColor: NowUIColors.bgColorScreen,
      body: Padding(
        padding: const EdgeInsets.only(left: 36.0, right: 36.0),
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: Text("Recommended Settings",
                    style: TextStyle(
                        color: NowUIColors.text,
                        fontWeight: FontWeight.w600,
                        fontSize: 18)),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text("These are the most important settings",
                    style: TextStyle(color: NowUIColors.text, fontSize: 14)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Someone mentions me",
                      style: TextStyle(color: NowUIColors.text)),
                  Switch.adaptive(
                    value: switchValueOne,
                    onChanged: (bool newValue) =>
                        setState(() => switchValueOne = newValue),
                    activeColor: NowUIColors.primary,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Anyone follows me",
                      style: TextStyle(color: NowUIColors.text)),
                  Switch.adaptive(
                    value: switchValueTwo,
                    onChanged: (bool newValue) =>
                        setState(() => switchValueTwo = newValue),
                    activeColor: NowUIColors.primary,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Someone comments me",
                      style: TextStyle(color: NowUIColors.text)),
                  Switch.adaptive(
                    value: switchValueThree,
                    onChanged: (bool newValue) =>
                        setState(() => switchValueThree = newValue),
                    activeColor: NowUIColors.primary,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("A seller follows me",
                      style: TextStyle(color: NowUIColors.text)),
                  Switch.adaptive(
                    value: switchValueFour,
                    onChanged: (bool newValue) =>
                        setState(() => switchValueFour = newValue),
                    activeColor: NowUIColors.primary,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
