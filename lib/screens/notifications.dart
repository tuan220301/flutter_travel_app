import 'package:flutter/material.dart';
import 'package:travel_app/constants/Theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//widgets
import 'package:travel_app/widgets/navbar.dart';

final List<Map<String, String>> personalNotificationsList = [
  {
    "text":
        "About your order #45C23B Wifey made the best Father's Day meal ever. So thankful so happy.",
    "time": "15:30",
    "color": "primary"
  },
  {
    "text":
        "Customize our products. Now you can make the best and perfect clothes just for you.",
    "time": "12:10",
    "color": "info"
  },
  {
    "text":
        "Breaking News! We have new methods to payment. Learn how to pay off debt fast using the stack method.",
    "time": "11:23",
    "color": "error"
  },
  {
    "text":
        "Congratulations! Someone just ordered a pair of Yamaha HS8 speakers through your app! Hurry up and ship them!",
    "time": "04:23",
    "color": "success"
  }
];

final Map<String, List<Map<String, String>>> systemNotificationsList = {
  "Unread notifications": [
    {
      "description": "The new message from the author.",
      "title": "New message",
      "time": "2 hrs ago"
    },
    {
      "description": "A confirmed request by one party.",
      "title": "New order",
      "time": "3 hrs ago"
    }
  ],
  "Read notifications": [
    {
      "description": "Let's meet at Starbucks at 11:30. Wdyt?",
      "title": "Last message",
      "time": "1 day ago"
    },
    {
      "description": "A new issue has been reported for you.",
      "title": "Product issue",
      "time": "2 days ago"
    },
    {
      "description": "Your posts have been liked a lot.",
      "title": "New likes",
      "time": "4 days ago"
    }
  ]
};

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _widgetOptions = <Widget>[
    Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: PersonalNotifications(),
    ),
    Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SystemNotifications(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Notifications",
          backButton: true,
          rightOptions: false,
        ),
        backgroundColor: NowUIColors.bgColorScreen,
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Personal"),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.database, size: 16),
                label: "System",
              )
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: NowUIColors.primary,
            onTap: _onItemTapped),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: _widgetOptions.elementAt(_selectedIndex),
        ));
  }
}

class PersonalNotifications extends StatelessWidget {
  const PersonalNotifications({super.key});

  _personalCardBgColor(int index) {
    switch (personalNotificationsList[index]['color']) {
      case 'primary':
        {
          return NowUIColors.primary;
        }
      // break;
      case 'info':
        {
          return NowUIColors.primary;
        }
      // break;
      case 'error':
        {
          return NowUIColors.primary;
        }
      // break;
      case 'success':
        {
          return NowUIColors.primary;
        }
      // break;
      default:
        {
          return NowUIColors.primary;
        }
      // break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: personalNotificationsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              margin: const EdgeInsets.only(top: 24.0, bottom: 0.0),
              shadowColor: NowUIColors.muted.withOpacity(0.3),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 36, bottom: 36),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: NowUIColors.muted.withOpacity(.15),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 15,
                                spreadRadius: 5,
                                color: NowUIColors.muted.withOpacity(.25),
                              )
                            ]),
                        child: CircleAvatar(
                            radius: 24,
                            backgroundColor: _personalCardBgColor(index),
                            child: const Icon(Icons.local_shipping,
                                color: NowUIColors.white, size: 24.0)),
                      ),
                      Flexible(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Text(personalNotificationsList[index]['text']!,
                            style: const TextStyle(color: NowUIColors.text)),
                      )),
                      Row(
                        children: [
                          const Icon(Icons.timelapse,
                              size: 14.0, color: NowUIColors.time),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(personalNotificationsList[index]["time"]!,
                              style: const TextStyle(color: NowUIColors.time)),
                        ],
                      )
                    ]),
              ));
        });
  }
}

class SystemNotifications extends StatelessWidget {
  const SystemNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                color: NowUIColors.white,
                boxShadow: [
                  BoxShadow(
                      color: NowUIColors.black.withOpacity(0.1),
                      offset: const Offset(0, 0.5),
                      spreadRadius: 3,
                      blurRadius: 10)
                ]),
            margin: const EdgeInsets.only(top: 32.0),
            // height: 400,
            child: Column(
              children: [
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text('Unread notifications',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: NowUIColors.text,
                              fontWeight: FontWeight.w600)),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: systemNotificationsList['Unread notifications']
                          ?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, left: 16, right: 16, bottom: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: NowUIColors.success,
                                  child: Icon(Icons.chat_bubble,
                                      size: 16, color: NowUIColors.white),
                                ),
                              ),
                              Flexible(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          flex: 2,
                                          child: Text(
                                              systemNotificationsList[
                                                      'Unread notifications']![
                                                  index]["title"]!,
                                              style: const TextStyle(
                                                  color: NowUIColors.time,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.timelapse,
                                                size: 14.0,
                                                color: NowUIColors.time),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                                systemNotificationsList[
                                                        'Unread notifications']![
                                                    index]["time"]!,
                                                style: const TextStyle(
                                                    color: NowUIColors.time)),
                                          ],
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Text(
                                          systemNotificationsList[
                                                  'Unread notifications']![
                                              index]["description"]!,
                                          style: const TextStyle(
                                              color: NowUIColors.text,
                                              fontWeight: FontWeight.w600)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 32.0),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                color: NowUIColors.white,
                boxShadow: [
                  BoxShadow(
                      color: NowUIColors.black.withOpacity(0.1),
                      offset: const Offset(0, 0.5),
                      spreadRadius: 3,
                      blurRadius: 10)
                ]),
            // height: 400,
            child: Column(
              children: [
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text('Read notifications',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: NowUIColors.text,
                              fontWeight: FontWeight.w600)),
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount:
                          systemNotificationsList['Read notifications']?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, left: 16, right: 16, bottom: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: NowUIColors.error,
                                  child: Icon(Icons.chat_bubble,
                                      size: 16, color: NowUIColors.white),
                                ),
                              ),
                              Flexible(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          flex: 2,
                                          child: Text(
                                              systemNotificationsList[
                                                      'Read notifications']![
                                                  index]["title"]!,
                                              style: const TextStyle(
                                                  color: NowUIColors.time,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.timelapse,
                                                size: 14.0,
                                                color: NowUIColors.time),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            Text(
                                                systemNotificationsList[
                                                        'Read notifications']![
                                                    index]["time"]!,
                                                style: const TextStyle(
                                                    color: NowUIColors.time)),
                                          ],
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Text(
                                          systemNotificationsList[
                                                  'Read notifications']![index]
                                              ["description"]!,
                                          style: const TextStyle(
                                              color: NowUIColors.text,
                                              fontWeight: FontWeight.w400)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
