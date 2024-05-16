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
    apiKey: 'AIzaSyAH4cGnPpGneCeNo0Y3iwEkeecGs9Kd-cs',
    appId: '1:302061455079:android:68066dba66cf36a154c442',
    messagingSenderId: '302061455079',
    projectId: 'wias-app',
    storageBucket: 'wias-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBSSX5xnYDRI4W0yxLafNUSnnojt0j1Jmo',
    appId: '1:302061455079:ios:f7ea04752b80258654c442',
    messagingSenderId: '302061455079',
    projectId: 'wias-app',
    storageBucket: 'wias-app.appspot.com',
    androidClientId: '302061455079-s4l02g5houa9onjguobv8kstbcpcigc9.apps.googleusercontent.com',
    iosClientId: '302061455079-gs40ikbtm8nct1bafnhja12ugcd11eqh.apps.googleusercontent.com',
    iosBundleId: 'com.appspot.wias',
  );

}