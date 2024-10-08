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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDlqKJU2XgShg_fPuXXIfowk8mjHFhdC4Y',
    appId: '1:143095121157:web:912a2d3b05e6357212e36c',
    messagingSenderId: '143095121157',
    projectId: 'shop-buddy-eba28',
    authDomain: 'shop-buddy-eba28.firebaseapp.com',
    storageBucket: 'shop-buddy-eba28.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBdKOqKXBpHprHwJ7USJkTJzmthdFYaTG4',
    appId: '1:143095121157:android:51470abcb1a8f37a12e36c',
    messagingSenderId: '143095121157',
    projectId: 'shop-buddy-eba28',
    storageBucket: 'shop-buddy-eba28.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCFcJ0bz4jBc7Q8dXkrBV6qeTZXuS3fRXc',
    appId: '1:143095121157:ios:8c5f4561af1fe1fc12e36c',
    messagingSenderId: '143095121157',
    projectId: 'shop-buddy-eba28',
    storageBucket: 'shop-buddy-eba28.appspot.com',
    iosBundleId: 'com.example.adminshop',
  );
}
