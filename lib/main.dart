// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// import 'SignUpScreen.dart';


import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'SignUpScreen.dart';
import 'WelcomeScreen.dart';
//
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyAIlcxoudOiqNrGnzJM-QOh11vuCnEK_BI',
      appId: '1:217599773757:android:8852e62185fae0a5e36e54',
      messagingSenderId: '217599773757',
      projectId: 'hukum-c3925',
      storageBucket: 'hukum-c3925.appspot.com',
    ),
  );// Ensure Firebase is initialized
  runApp(MyApp());
}
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SignUpScreen(),
//     );
//   }
// }





// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(), // Set WelcomeScreen as the initial screen
      debugShowCheckedModeBanner: false,
    );
  }
}
