import 'package:flutter/material.dart';

import '../route/route.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Full-screen background image

          Image.network(
            'https://m.media-amazon.com/images/M/MV5BZmMzZDQ2MTMtNzlmZC00NTBhLTgxNDQtNTQ5MzI5ZTBkYTFlXkEyXkFqcGc@._V1_.jpg', // Replace with your image URL
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),

          // Overlay content (Movie+ text)
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Movi', // First part of the text
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // White color for "Movie"
                              ),
                            ),
                            TextSpan(
                              text: 'e+', // Second part of the text
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.red, // Red color for "+"
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Text above the buttons
          Positioned(
            bottom:
                200, // Adjust this value to position the text above the buttons
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'A movie app allows users to discover, stream, '
                  'and enjoy films anytime, anywhere.',
                  style: TextStyle(
                    fontSize: 18, // Adjust font size
                    color: Colors.white,
                    fontWeight: FontWeight.bold, // Text color
                  ),
                  textAlign: TextAlign.center, // Center align the text
                ),
              ),
            ),
          ),

          // Buttons at the bottom
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(1.0), // Bottom with high opacity
                      Colors.black.withOpacity(0.2), // Top with low opacity
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Sign In Button
                    ElevatedButton(
                      onPressed: () {
                        // Handle sign-in action
                        Navigator.pushNamed(context, RouteManager.home);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(
                            0xFFF71C24), // Complete hex color value with alpha
                        minimumSize: const Size(double.infinity, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Continue with Google Button
                    ElevatedButton.icon(
                      onPressed: () {
                        // Handle continue with Google action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.transparent, // Button background color
                        minimumSize:
                            const Size(double.infinity, 60), // Button size
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
                          side: const BorderSide(
                            color: Colors.white, // Border color
                            width: 2, // Border width
                          ),
                        ),
                        elevation: 5, // Shadow/elevation
                      ),
                      icon: const Icon(
                        Icons.g_mobiledata,
                        color: Colors.white, // Icon color
                        size: 24,
                      ),
                      label: const Text(
                        'Continue with Google',
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
