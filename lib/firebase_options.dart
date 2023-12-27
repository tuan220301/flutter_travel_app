// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyALkGhH8SbygIcN7iiWd7GT2hPqbeBAzbY',
    appId: '1:421028602591:android:eaa40d3b2c476c320dff6a',
    messagingSenderId: '421028602591',
    projectId: 'travel-app-f4ac0',
    storageBucket: 'travel-app-f4ac0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA00ZPWfs9RQnp51U1d3XDbm87jjSsxvVs',
    appId: '1:421028602591:ios:5ccdded24bd22b4d0dff6a',
    messagingSenderId: '421028602591',
    projectId: 'travel-app-f4ac0',
    storageBucket: 'travel-app-f4ac0.appspot.com',
    androidClientId: '421028602591-pla7dvasfd02domkda1irv7o5537v7tm.apps.googleusercontent.com',
    iosClientId: '421028602591-rg2gvfh8582jkpm9js4deukrt6dmi6os.apps.googleusercontent.com',
    iosBundleId: 'com.example.travelApp',
  );
}
