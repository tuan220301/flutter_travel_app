import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:travel_app/constants/Theme.dart';
import 'package:travel_app/constants/printCus.dart';
import 'package:travel_app/widgets/cus_toast.dart';

class BodyBottomSheet extends StatefulWidget {
  const BodyBottomSheet({
    this.title = "Placeholder Title",
    this.img = "https://via.placeholder.com/250",
    this.header = '',
    this.body = '',
    this.imgDes = '',
    this.footer = '',
    this.location = '',
    this.phone = '',
    required this.lat,
    required this.long,
    required this.closeModal,
  });

  final String img;
  final String title;
  final String header;
  final String imgDes;
  final String body;
  final String footer;
  final String location;
  final String phone;
  final double lat;
  final double long;
  final VoidCallback closeModal;

  @override
  _BodyBottomSheetState createState() => _BodyBottomSheetState();
}

class _BodyBottomSheetState extends State<BodyBottomSheet> {
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  void openOnMap(lat, long) {
    printDebug('lat', lat);
    printDebug('long', long);
    MapsLauncher.launchCoordinates(lat, long);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                padding: const EdgeInsets.all(0.0),
                focusColor: NowUIColors.active,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: widget.closeModal,
                icon: const Icon(FontAwesomeIcons.circleXmark),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Số điện thoại: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        widget.phone,
                        style: const TextStyle(
                          fontSize: 14,
                          color: NowUIColors.active,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await Clipboard.setData(
                              ClipboardData(text: widget.phone));
                          fToast.showToast(
                            child: const CusToast(
                              content: 'Đã copy số điện thoại',
                              icon: FontAwesomeIcons.check,
                            ),
                            gravity: ToastGravity.BOTTOM,
                          );
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        iconSize: 20,
                        icon: const Icon(FontAwesomeIcons.copy),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      text: 'Địa chỉ: ',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: widget.location,
                            style: const TextStyle(
                              fontSize: 14,
                              color: NowUIColors.info,
                            ),
                            recognizer: TapGestureRecognizer()
                              // ..onTap = () async {
                              //   await Clipboard.setData(
                              //       ClipboardData(text: widget.phone));
                              //   fToast.showToast(
                              //     child: const CusToast(
                              //       content: 'Đã copy địa chỉ',
                              //       icon: FontAwesomeIcons.check,
                              //     ),
                              //     gravity: ToastGravity.BOTTOM,
                              //   );
                              // },
                              ..onTap =
                                  () => openOnMap(widget.lat, widget.long)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.header,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  Image(
                    image: AssetImage(widget.img),
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.body,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  Image(
                    image: AssetImage(widget.imgDes),
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.footer,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
