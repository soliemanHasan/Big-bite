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
    apiKey: 'AIzaSyAh-yrADsYJcxuNnSVPuDPwSS452CDf6LY',
    appId: '1:310307124384:web:54dca722c624c2d65b85c5',
    messagingSenderId: '310307124384',
    projectId: 'bigbite-5698c',
    authDomain: 'bigbite-5698c.firebaseapp.com',
    storageBucket: 'bigbite-5698c.appspot.com',
    measurementId: 'G-ECMNRB0LCK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAemlr4LM2nHf6hKcCPMtakTohB1bo1ZNA',
    appId: '1:310307124384:android:d78bd3c11650c9b55b85c5',
    messagingSenderId: '310307124384',
    projectId: 'bigbite-5698c',
    storageBucket: 'bigbite-5698c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBGLGWTpsJfq0IXEs3p0I8vT7YQdefpUHY',
    appId: '1:310307124384:ios:ff4be782de5cbb8c5b85c5',
    messagingSenderId: '310307124384',
    projectId: 'bigbite-5698c',
    storageBucket: 'bigbite-5698c.appspot.com',
    iosBundleId: 'com.example.bigBite',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBGLGWTpsJfq0IXEs3p0I8vT7YQdefpUHY',
    appId: '1:310307124384:ios:ff4be782de5cbb8c5b85c5',
    messagingSenderId: '310307124384',
    projectId: 'bigbite-5698c',
    storageBucket: 'bigbite-5698c.appspot.com',
    iosBundleId: 'com.example.bigBite',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAh-yrADsYJcxuNnSVPuDPwSS452CDf6LY',
    appId: '1:310307124384:web:e86a50dd57e17cb15b85c5',
    messagingSenderId: '310307124384',
    projectId: 'bigbite-5698c',
    authDomain: 'bigbite-5698c.firebaseapp.com',
    storageBucket: 'bigbite-5698c.appspot.com',
    measurementId: 'G-LXXN0ZRHVV',
  );
}
