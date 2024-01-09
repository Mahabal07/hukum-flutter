import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/signinbackground.jpg',
            fit: BoxFit.cover,
          ),
          // Sign In Options
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSignInOption('Continue with Google', () {
                  // Handle Google sign-in
                }),
                buildSignInOption('Continue with Facebook', () {
                  // Handle Facebook sign-in
                }),
                buildSignInOption('Continue with Mobile Number', () {
                  // Handle Mobile Number sign-in
                }),
                buildSignInOption('Continue with Email', () {
                  // Handle Email sign-in
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSignInOption(String title, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
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
