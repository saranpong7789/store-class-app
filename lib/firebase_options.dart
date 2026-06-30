import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdLt1-rTOsMy_bIQJwwYHspQ5pg9iG7oo',
    appId: '1:48503338243:android:695e98fed19f5b9af3e536',
    messagingSenderId: '48503338243',
    projectId: 'store-class-39074',
    databaseURL: 'https://store-class-39074.firebaseio.com',
    storageBucket: 'store-class-39074.firebasestorage.app',
  );

  static FirebaseOptions get currentPlatform {
    return android;
  }
}
