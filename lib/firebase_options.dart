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
    apiKey: 'AIzaSyDBD7PzQoLkIG9F013otVPUp0PssNLANKU',
    appId: '1:763083832014:web:90605db7028815003aee9f',
    messagingSenderId: '763083832014',
    projectId: 'remindit-fbz',
    authDomain: 'remindit-fbz.firebaseapp.com',
    storageBucket: 'remindit-fbz.appspot.com',
    measurementId: 'G-K0W26DTB0L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXGnSwqKUkUP49pebLvWVpVHIHjHtw8L0',
    appId: '1:763083832014:android:ff80b4596b5e7bec3aee9f',
    messagingSenderId: '763083832014',
    projectId: 'remindit-fbz',
    storageBucket: 'remindit-fbz.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDH7ns6u-B4W_SFFR0ffflDlpYmuenF__M',
    appId: '1:763083832014:ios:1ea98ea3339e92a13aee9f',
    messagingSenderId: '763083832014',
    projectId: 'remindit-fbz',
    storageBucket: 'remindit-fbz.appspot.com',
    iosBundleId: 'com.example.remindits',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDH7ns6u-B4W_SFFR0ffflDlpYmuenF__M',
    appId: '1:763083832014:ios:1ea98ea3339e92a13aee9f',
    messagingSenderId: '763083832014',
    projectId: 'remindit-fbz',
    storageBucket: 'remindit-fbz.appspot.com',
    iosBundleId: 'com.example.remindits',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDBD7PzQoLkIG9F013otVPUp0PssNLANKU',
    appId: '1:763083832014:web:aa2a04ecbb13b03b3aee9f',
    messagingSenderId: '763083832014',
    projectId: 'remindit-fbz',
    authDomain: 'remindit-fbz.firebaseapp.com',
    storageBucket: 'remindit-fbz.appspot.com',
    measurementId: 'G-8RFP9T9HDN',
  );
}
