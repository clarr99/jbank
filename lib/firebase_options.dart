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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPM1J9W8JF-uggTYrcBwBB3nPthkPy1S8',
    appId: '1:1079360119623:android:48fe977d60f2ed95152262',
    messagingSenderId: '1079360119623',
    projectId: 'jbank-36bae',
    storageBucket: 'jbank-36bae.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBv8R_I8mTyQQ3AovJfXp5dY2zFOZ1r_o8',
    appId: '1:1079360119623:ios:60f9c4ddf804d161152262',
    messagingSenderId: '1079360119623',
    projectId: 'jbank-36bae',
    storageBucket: 'jbank-36bae.firebasestorage.app',
    iosBundleId: 'com.example.jbank',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBI7yxYC0WcB2HkI8NWrYNyH7Y1lbN4Dcw',
    appId: '1:1079360119623:web:3a63b3dcd456ca4b152262',
    messagingSenderId: '1079360119623',
    projectId: 'jbank-36bae',
    authDomain: 'jbank-36bae.firebaseapp.com',
    storageBucket: 'jbank-36bae.firebasestorage.app',
    measurementId: 'G-2MW5WYYRNP',
  );
}
