// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCtnUDeoHuY-PHCl92s36V69GrZPMnEUnE',
    appId: '1:996732169670:web:2a1e91471f69ea37cf96c7',
    messagingSenderId: '996732169670',
    projectId: 'instagram-94dcd',
    authDomain: 'instagram-94dcd.firebaseapp.com',
    storageBucket: 'instagram-94dcd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3a2ZDkCC8QKmY6ZQTuth4gyOzENXQXdI',
    appId: '1:996732169670:android:0e8b3019d72a42a5cf96c7',
    messagingSenderId: '996732169670',
    projectId: 'instagram-94dcd',
    storageBucket: 'instagram-94dcd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBD2WCFfuuvlGdYMI9E1ZVnLKqKAHV_RVQ',
    appId: '1:996732169670:ios:65a1d8493b7f6954cf96c7',
    messagingSenderId: '996732169670',
    projectId: 'instagram-94dcd',
    storageBucket: 'instagram-94dcd.appspot.com',
    iosBundleId: 'com.example.instagram',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBD2WCFfuuvlGdYMI9E1ZVnLKqKAHV_RVQ',
    appId: '1:996732169670:ios:65a1d8493b7f6954cf96c7',
    messagingSenderId: '996732169670',
    projectId: 'instagram-94dcd',
    storageBucket: 'instagram-94dcd.appspot.com',
    iosBundleId: 'com.example.instagram',
  );
}