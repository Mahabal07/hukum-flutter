import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

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
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hukum App'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              // Test Firebase functionality here
              print('Firebase is working!');
            },
            child: Text('Test Firebase'),
          ),
        ),
      ),
    );
  }
}
