import 'package:Hukum/signin_page.dart';
import 'package:flutter/material.dart';

// class SignInScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign In'),
//       ),
//       body: Center(
//         child: Text('This is the Sign In screen'), // Replace with your actual sign-in content
//       ),
//     );
//   }
// }

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/welcome_image3.jpg',
            fit: BoxFit.cover,
          ),
          // Welcome Text
          // Center(
          //   child: Text(
          //     'Welcome to Hukum',
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 24,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          // Sign In Button
          Positioned(
            bottom: 30,
            left: 100,
            right: 100,
            child: Container(
              width: 20, // Set the desired width for the button
              child: ElevatedButton(
                onPressed: () {
                  // Handle Sign In button click with a smooth transition
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => SignInPage(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        const begin = Offset(0.0, 1.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;

                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Text('Sign In'),
              ),
            ),
          ),
        ],
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
      home: WelcomeScreen(), // Set WelcomeScreen as the home screen
    );
  }
}
