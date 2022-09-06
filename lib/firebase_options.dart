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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAaitZH4JbwY2yZt4p9ppjZSlwVUIhHqkE',
    appId: '1:504739206861:web:04e8eeb01262edeb507b84',
    messagingSenderId: '504739206861',
    projectId: 'medicine-d376a',
    authDomain: 'medicine-d376a.firebaseapp.com',
    storageBucket: 'medicine-d376a.appspot.com',
    measurementId: 'G-CNWWMP1ESW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8-molYS9EaKKAZFQriOnG1JzqqIuGPxI',
    appId: '1:504739206861:android:a6f28124947cebba507b84',
    messagingSenderId: '504739206861',
    projectId: 'medicine-d376a',
    storageBucket: 'medicine-d376a.appspot.com',
  );
}
