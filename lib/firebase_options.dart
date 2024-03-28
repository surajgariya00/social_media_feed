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
    apiKey: 'AIzaSyC00gbeRr1tWSLf_RnI-MsBVVS1HU49mic',
    appId: '1:1039799013129:web:6fab51512c10f7e9670dd8',
    messagingSenderId: '1039799013129',
    projectId: 'socialmedia-feed-26324',
    authDomain: 'socialmedia-feed-26324.firebaseapp.com',
    storageBucket: 'socialmedia-feed-26324.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_svmJgUjr0D_p8QFJE0jlIA_p4BkrAAU',
    appId: '1:1039799013129:android:de85fdfe3ced2729670dd8',
    messagingSenderId: '1039799013129',
    projectId: 'socialmedia-feed-26324',
    storageBucket: 'socialmedia-feed-26324.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1sXkLihdTYqR75w1tbN2jkyi7_QG5Rdg',
    appId: '1:1039799013129:ios:c5550456c3e5c99e670dd8',
    messagingSenderId: '1039799013129',
    projectId: 'socialmedia-feed-26324',
    storageBucket: 'socialmedia-feed-26324.appspot.com',
    iosBundleId: 'com.example.socialMediaFeed',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD1sXkLihdTYqR75w1tbN2jkyi7_QG5Rdg',
    appId: '1:1039799013129:ios:77b4808ded3545ac670dd8',
    messagingSenderId: '1039799013129',
    projectId: 'socialmedia-feed-26324',
    storageBucket: 'socialmedia-feed-26324.appspot.com',
    iosBundleId: 'com.example.socialMediaFeed.RunnerTests',
  );
}
