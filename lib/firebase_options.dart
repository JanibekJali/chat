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
    apiKey: 'AIzaSyAe2Du1MdYls4HIrzifkZbGnzrhVTIliMs',
    appId: '1:108186975857:web:c27ca939cdffa76707a5d0',
    messagingSenderId: '108186975857',
    projectId: 'chat-28508',
    authDomain: 'chat-28508.firebaseapp.com',
    storageBucket: 'chat-28508.appspot.com',
    measurementId: 'G-W2MRT064QJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyChhJNIII1v99Gy-Jpvfs5RsRUdi0cIsAk',
    appId: '1:108186975857:android:96453f6308a3861907a5d0',
    messagingSenderId: '108186975857',
    projectId: 'chat-28508',
    storageBucket: 'chat-28508.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIAa56hZnfdpNCl8WXmNqgiScOaWGzzuI',
    appId: '1:108186975857:ios:0079f98409df591207a5d0',
    messagingSenderId: '108186975857',
    projectId: 'chat-28508',
    storageBucket: 'chat-28508.appspot.com',
    iosClientId: '108186975857-eae2pt1qqigqmsd0kta2hpvsf6lrk21l.apps.googleusercontent.com',
    iosBundleId: 'kg.chat.chat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBIAa56hZnfdpNCl8WXmNqgiScOaWGzzuI',
    appId: '1:108186975857:ios:0079f98409df591207a5d0',
    messagingSenderId: '108186975857',
    projectId: 'chat-28508',
    storageBucket: 'chat-28508.appspot.com',
    iosClientId: '108186975857-eae2pt1qqigqmsd0kta2hpvsf6lrk21l.apps.googleusercontent.com',
    iosBundleId: 'kg.chat.chat',
  );
}
