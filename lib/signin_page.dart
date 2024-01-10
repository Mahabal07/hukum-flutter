import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/signinbackground2.jpg',
            fit: BoxFit.cover,
          ),
          // Sign In Options
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSignInOption('Google', 'assets/google_icon.svg', () {
                  // Handle Google sign-in
                }),
                buildSignInOption('Facebook', 'assets/facebook_icon.svg', () {
                  // Handle Facebook sign-in
                }),
                buildSignInOption('Mobile Number', 'assets/phone_icon.svg', () {
                  // Handle Mobile Number sign-in
                }),
                buildSignInOption('Email', 'assets/email_icon.svg', () {
                  _signInWithEmail(context, 'user@example.com', 'password123');
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _signInWithEmail(BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,

      );

      // If the user doesn't exist, create an account
      if (userCredential.user == null) {
        userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      }

      print('Email: $email, Password: $password');

      // Navigate to the next screen or perform other actions after sign-in
      print('Signed in or created account: ${userCredential.user?.email}');
    } catch (e) {
      // Handle sign-in or create account errors
      print('Error during sign-in or create account: $e');
      print('Error code: ${(e as FirebaseAuthException).code}');
      print('Error message: ${(e as FirebaseAuthException).message}');
      // You can show an error message using a SnackBar or Dialog
    }
  }

  Widget buildSignInOption(String provider, String iconPath, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 32,
              height: 32,
            ),
            SizedBox(width: 8),
            Text(
              'Sign in with $provider',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(), // Set SignInPage as the home screen
    );
  }
}
