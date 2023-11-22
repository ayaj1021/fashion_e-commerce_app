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
    apiKey: 'AIzaSyAKa7jP9YnHsVhuZfV7VVM0ExQ1YIwi-is',
    appId: '1:32197835535:web:370dfa34f75e9b66999c7a',
    messagingSenderId: '32197835535',
    projectId: 'fashion-e-commerce-app-8df6a',
    authDomain: 'fashion-e-commerce-app-8df6a.firebaseapp.com',
    storageBucket: 'fashion-e-commerce-app-8df6a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCnxglEgH_Gosw66wbScuQw-INUdUDxo3Q',
    appId: '1:32197835535:android:8f9a09a6c5975047999c7a',
    messagingSenderId: '32197835535',
    projectId: 'fashion-e-commerce-app-8df6a',
    storageBucket: 'fashion-e-commerce-app-8df6a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDa_tl_mzQhGFnQY6rQV1h0qJoHlwBQqj8',
    appId: '1:32197835535:ios:8d298990cec89337999c7a',
    messagingSenderId: '32197835535',
    projectId: 'fashion-e-commerce-app-8df6a',
    storageBucket: 'fashion-e-commerce-app-8df6a.appspot.com',
    iosBundleId: 'com.example.fashionEcommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDa_tl_mzQhGFnQY6rQV1h0qJoHlwBQqj8',
    appId: '1:32197835535:ios:5b2cfb61aba22c75999c7a',
    messagingSenderId: '32197835535',
    projectId: 'fashion-e-commerce-app-8df6a',
    storageBucket: 'fashion-e-commerce-app-8df6a.appspot.com',
    iosBundleId: 'com.example.fashionEcommerceApp.RunnerTests',
  );
}
