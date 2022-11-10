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
    apiKey: 'AIzaSyC6O9zPvAyJB6NQJCY9YnU_McIOfIVpSC0',
    appId: '1:990525508650:web:df91919079ccacf6494753',
    messagingSenderId: '990525508650',
    projectId: 'ouul-2a38d',
    authDomain: 'ouul-2a38d.firebaseapp.com',
    storageBucket: 'ouul-2a38d.appspot.com',
    measurementId: 'G-GY84RXN41P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrpuqPbPd4Vzcrc2hBGwemdxXLvgUi6Kw',
    appId: '1:990525508650:android:3471d78981b9befc494753',
    messagingSenderId: '990525508650',
    projectId: 'ouul-2a38d',
    storageBucket: 'ouul-2a38d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjU6QpUNrZfTSe5k2keuYrECra9cyd7rE',
    appId: '1:990525508650:ios:f2bf166fd9ae62f0494753',
    messagingSenderId: '990525508650',
    projectId: 'ouul-2a38d',
    storageBucket: 'ouul-2a38d.appspot.com',
    iosClientId: '990525508650-1ubacfjvmr0o7q7cjg56pvctsq1acj79.apps.googleusercontent.com',
    iosBundleId: 'com.example.ouul',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBjU6QpUNrZfTSe5k2keuYrECra9cyd7rE',
    appId: '1:990525508650:ios:f2bf166fd9ae62f0494753',
    messagingSenderId: '990525508650',
    projectId: 'ouul-2a38d',
    storageBucket: 'ouul-2a38d.appspot.com',
    iosClientId: '990525508650-1ubacfjvmr0o7q7cjg56pvctsq1acj79.apps.googleusercontent.com',
    iosBundleId: 'com.example.ouul',
  );
}