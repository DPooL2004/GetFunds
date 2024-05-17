// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart';
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
        return windows;
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
    apiKey: 'AIzaSyCOX4l0eA8l-NNtX6j0XN96PBnZepzWBh0',
    appId: '1:915683707396:web:4b8c39399776e2a62a8351',
    messagingSenderId: '915683707396',
    projectId: 'getfunds-d99f9',
    authDomain: 'getfunds-d99f9.firebaseapp.com',
    storageBucket: 'getfunds-d99f9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBcip-CCQsJhIXdL2cs80d1QMALAQISeoY',
    appId: '1:915683707396:android:e8ccdbccbb79284c2a8351',
    messagingSenderId: '915683707396',
    projectId: 'getfunds-d99f9',
    storageBucket: 'getfunds-d99f9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA83DZiC3QWms_dsxQFZh-aJx1ZQOPEw18',
    appId: '1:915683707396:ios:2ad2dc99463853702a8351',
    messagingSenderId: '915683707396',
    projectId: 'getfunds-d99f9',
    storageBucket: 'getfunds-d99f9.appspot.com',
    iosBundleId: 'com.example.getfunds',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA83DZiC3QWms_dsxQFZh-aJx1ZQOPEw18',
    appId: '1:915683707396:ios:2ad2dc99463853702a8351',
    messagingSenderId: '915683707396',
    projectId: 'getfunds-d99f9',
    storageBucket: 'getfunds-d99f9.appspot.com',
    iosBundleId: 'com.example.getfunds',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCOX4l0eA8l-NNtX6j0XN96PBnZepzWBh0',
    appId: '1:915683707396:web:5d3fbfba6923bfef2a8351',
    messagingSenderId: '915683707396',
    projectId: 'getfunds-d99f9',
    authDomain: 'getfunds-d99f9.firebaseapp.com',
    storageBucket: 'getfunds-d99f9.appspot.com',
  );
}
