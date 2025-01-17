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
    apiKey: 'AIzaSyAWuS3196T49dwoA3RFVCGUgnIngVhytXQ',
    appId: '1:260983379937:web:7124be90343d89118264a0',
    messagingSenderId: '260983379937',
    projectId: 'splittingapp-437d2',
    authDomain: 'splittingapp-437d2.firebaseapp.com',
    storageBucket: 'splittingapp-437d2.appspot.com',
    measurementId: 'G-TF0HSYZTYS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDsK-nGHzLwT0T6EgC1QtU2g28iVWv31R4',
    appId: '1:260983379937:android:3c125ce30f524cce8264a0',
    messagingSenderId: '260983379937',
    projectId: 'splittingapp-437d2',
    storageBucket: 'splittingapp-437d2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDOpDLjj3H-U9-S18V3B9s9CJQsBP_-DmI',
    appId: '1:260983379937:ios:b29eaa5ed7a213658264a0',
    messagingSenderId: '260983379937',
    projectId: 'splittingapp-437d2',
    storageBucket: 'splittingapp-437d2.appspot.com',
    iosBundleId: 'com.example.splittingapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDOpDLjj3H-U9-S18V3B9s9CJQsBP_-DmI',
    appId: '1:260983379937:ios:b29eaa5ed7a213658264a0',
    messagingSenderId: '260983379937',
    projectId: 'splittingapp-437d2',
    storageBucket: 'splittingapp-437d2.appspot.com',
    iosBundleId: 'com.example.splittingapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAWuS3196T49dwoA3RFVCGUgnIngVhytXQ',
    appId: '1:260983379937:web:9c8498df083d63c88264a0',
    messagingSenderId: '260983379937',
    projectId: 'splittingapp-437d2',
    authDomain: 'splittingapp-437d2.firebaseapp.com',
    storageBucket: 'splittingapp-437d2.appspot.com',
    measurementId: 'G-B4HSJ6MQCV',
  );
}
