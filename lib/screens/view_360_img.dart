import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:travel_app/constants/Theme.dart';
import 'package:travel_app/constants/printCus.dart';

class View360Image extends StatelessWidget {
  const View360Image({super.key});
  void handleChangeView(context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowUIColors.bgColorScreen,
      body: SizedBox(
        // padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        // height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: PanoramaViewer(
              hotspots: [
                Hotspot(
                    latitude: -41.41168320784198,
                    longitude: 61.46808179736491,
                    name: 'Description',
                    width: 100,
                    height: 50,
                    widget: Container(
                      width: 100,
                      height: 50,
                      color: Colors.blue,
                      child: Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () => handleChangeView(context),
                          child: const Text(
                            'turn back',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ))
              ],
              child: Image.asset(
                  'assets/imgs/360_imgs/IMG_20231219_110647_00_064.dng'),
              onTap: (longitude, latitude, tilt) => {
                    printDebug('longitude', longitude),
                    printDebug('latitude', latitude)
                  }),
        ),
      ),
    );
  }
}
