// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

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
    apiKey: 'AIzaSyBPxG3u8IBmgT0UhWMaKTtZyh5rRybUc7A',
    appId: '1:684215639062:web:51f09069bee118a47aa937',
    messagingSenderId: '684215639062',
    projectId: 'reference-app-dev-e4898',
    authDomain: 'reference-app-dev-e4898.firebaseapp.com',
    storageBucket: 'reference-app-dev-e4898.appspot.com',
    measurementId: 'G-DX3PMSKFG1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeFLOYK1SC0qe_pWptGcWgWo7yHljmbTg',
    appId: '1:684215639062:android:d384d422497c4d777aa937',
    messagingSenderId: '684215639062',
    projectId: 'reference-app-dev-e4898',
    storageBucket: 'reference-app-dev-e4898.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCtmLueFfm3_rjpOwgyHUXedDUZOxNyfn8',
    appId: '1:684215639062:ios:cfdb18cb2e38ecc57aa937',
    messagingSenderId: '684215639062',
    projectId: 'reference-app-dev-e4898',
    storageBucket: 'reference-app-dev-e4898.appspot.com',
    iosBundleId: 'com.example.referenceApp.RunnerTests',
  );
}
