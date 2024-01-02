import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:travel_app/constants/Theme.dart';
import 'package:travel_app/constants/printCus.dart';

class CustomPanoramaViewer extends StatefulWidget {
  final String imagePath;
  final double latitude;
  final double longitude;
  final Function onTap;
  final List ListHotPot;

  CustomPanoramaViewer({
    required this.imagePath,
    required this.latitude,
    required this.longitude,
    required this.onTap,
    required this.ListHotPot,
  });

  @override
  _CustomPanoramaViewerState createState() => _CustomPanoramaViewerState();
}

class _CustomPanoramaViewerState extends State<CustomPanoramaViewer> {
  final RxString urlImg = ''.obs;
  final RxBool isLoading = false.obs;
  final indexListBtn = 0.obs;
  @override
  void initState() {
    super.initState();
    urlImg.value = widget.imagePath;
  }

  Future<void> _precacheImage() async {
    // Precache the image using the AssetImage provider
    await precacheImage(AssetImage(urlImg.value), context);
  }

  Future<void> loadImage(String imageUrl) async {
    try {
      // load network image example
      await precacheImage(NetworkImage(imageUrl), context);
      // or
      // Load assets image example
      // await precacheImage(AssetImage(imagePath), context);
      printDebug('Image loaded and cached successfully!', '');
    } catch (e) {
      printDebug('Failed to load and cache the image: ', '$e');
    }
  }

  void handleChangeImageButton(int index) {
    urlImg.value = widget.ListHotPot[index]['image_360'];
    indexListBtn.value = index;
    printDebug('ListHotPot index update image', urlImg.value);
    isLoading.value = true;
    Duration timeDelay = const Duration(seconds: 1);
    Future.delayed(timeDelay, () {
      isLoading.value = false;
      loadImage(urlImg.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      printDebug('isLoading.value', isLoading.value);
      if (isLoading.value) {
        return CircularProgressIndicator(
          color: NowUIColors.black,
        );
      } else {
        return PanoramaViewer(
          latitude: double.parse(
              widget.ListHotPot[indexListBtn.value]['lat_def'].toString()),
          longitude: double.parse(
              widget.ListHotPot[indexListBtn.value]['lng_def'].toString()),
          hotspots:
              (widget.ListHotPot[indexListBtn.value]['list_button'] as List)
                  .map<Hotspot>((buttonData) {
            return Hotspot(
              latitude: double.parse(buttonData['lat'].toString()),
              longitude: double.parse(buttonData['lng'].toString()),
              name: 'Description',
              width: 50,
              height: 50,
              widget: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90.0),
                  color: Colors.grey[600]?.withOpacity(0.8),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90.0),
                        side: const BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                    ),
                    onPressed: () =>
                        handleChangeImageButton(buttonData['id_img'] - 1),
                    child: const Icon(FontAwesomeIcons.arrowUp, size: 20),
                  ),
                ),
              ),
            );
          }).toList(),
          child: Image.asset(
            urlImg.value,
            fit: BoxFit.contain,
          ),
          onTap: (longitude, latitude, tilt) {
            printDebug('imgUrl', urlImg.value);
            printDebug('Longitude', longitude);
            printDebug('Latitude', latitude);
          },
        );
      }
    });
  }
}
