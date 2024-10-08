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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAs5WLSp_7wP74X9-b-zS2mAJEblZQq4Zw',
    appId: '1:520476603498:android:0c6f88132e8b1635258613',
    messagingSenderId: '520476603498',
    projectId: 'bictov-3c983',
    storageBucket: 'bictov-3c983.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCnl6lLF6JcRNc3TY-S4to9WpNQR28-RSY',
    appId: '1:520476603498:ios:fe9e118ec4ff8a9c258613',
    messagingSenderId: '520476603498',
    projectId: 'bictov-3c983',
    storageBucket: 'bictov-3c983.appspot.com',
    iosClientId: '520476603498-un3nuf926uf7rvqp2g0conr2uo8og9gk.apps.googleusercontent.com',
    iosBundleId: 'com.example.bictov',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCnl6lLF6JcRNc3TY-S4to9WpNQR28-RSY',
    appId: '1:520476603498:ios:fe9e118ec4ff8a9c258613',
    messagingSenderId: '520476603498',
    projectId: 'bictov-3c983',
    storageBucket: 'bictov-3c983.appspot.com',
    iosClientId: '520476603498-un3nuf926uf7rvqp2g0conr2uo8og9gk.apps.googleusercontent.com',
    iosBundleId: 'com.example.bictov',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCMagD9IHJ1AvBDXSAR4QRCGgsMqa7xe5c',
    appId: '1:520476603498:web:f71721265303d524258613',
    messagingSenderId: '520476603498',
    projectId: 'bictov-3c983',
    authDomain: 'bictov-3c983.firebaseapp.com',
    storageBucket: 'bictov-3c983.appspot.com',
  );
}
