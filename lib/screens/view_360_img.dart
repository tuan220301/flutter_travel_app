import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:travel_app/constants/Theme.dart';
import 'package:travel_app/constants/printCus.dart';
import 'package:travel_app/widgets/drawer.dart';
import 'package:travel_app/widgets/navbar.dart';

class View360Image extends StatelessWidget {
  const View360Image({Key? key}) : super(key: key);

  void handleChangeView(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: "Tham quan 360",
      ),
      backgroundColor: NowUIColors.bgColorScreen,
      drawer: NowDrawer(currentPage: "View360Image"),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Expanded(
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
                          'Quay lại',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              child: Image.asset(
                'assets/imgs/360imgs/IMG_20231219_110647_00_064.dng',
                fit: BoxFit.cover,
              ),
              onTap: (longitude, latitude, tilt) {
                printDebug('Longitude', longitude);
                printDebug('Latitude', latitude);
              },
            ),
          ),
          // const SizedBox(
          //   height: 100,
          //   child: ,
          // )
        ],
      ),
    );
  }
}
