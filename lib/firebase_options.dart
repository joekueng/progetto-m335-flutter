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
    apiKey: 'AIzaSyCh2cA5AHNIS3e1Wnf48dfoCUKvmEM9J34',
    appId: '1:164857321043:android:0a67e4973f9208721ad8a6',
    messagingSenderId: '164857321043',
    projectId: 'progetto-m335',
    databaseURL: 'https://progetto-m335-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'progetto-m335.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhEex7OfyJHETyC-uSydOFGABBn5KX16Q',
    appId: '1:164857321043:ios:b497e5d24254d60e1ad8a6',
    messagingSenderId: '164857321043',
    projectId: 'progetto-m335',
    databaseURL: 'https://progetto-m335-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'progetto-m335.appspot.com',
    iosBundleId: 'ch.ameti.progettoM335Flutter',
  );
}