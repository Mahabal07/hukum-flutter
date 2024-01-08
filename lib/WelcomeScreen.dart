import 'package:flutter/material.dart';
import 'SignUpScreen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Welcome'),
      // ),
      body: Container(
        color: Colors.teal, // Set your preferred techy color
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Hukum App!',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 16),
                Text(
                  'Instructions:',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  '1. Form teams and select Hukum suit.',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '2. Play cards following the suit if possible.',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '3. Win sets by having the highest-valued cards.',
                  style: TextStyle(color: Colors.white),
                ),
                // Add more instructions as needed

                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange, // Set your preferred button color
                  ),
                  child: Text('Get Started'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
