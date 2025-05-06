import 'package:flutter/material.dart';
import 'package:movieappui/screen/MovieDetail.dart';
import 'package:movieappui/screen/homepage.dart';
import 'package:movieappui/screen/splash.dart';

// Your RouteManager class to handle navigation
class RouteManager {
  // Define routes as constants
  static const String splash = '/';
  static const String movie = '/loading';
  static const String home = '/homepage';

  // static const String Chefpage = '/homepage';  // This is the route for CustomBottomNavBar

  // Function to generate routes dynamically
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => Splash());

      case home:
        return MaterialPageRoute(builder: (context) => const Home());
      case movie:
        return MaterialPageRoute(builder: (context) => MovieDetailPage());
      // case loading:
      //   return MaterialPageRoute(builder: (context) => const SalonAppHome());

      default:
        return _errorRoute();
    }
  }

  // Fallback route if an invalid route is provided
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(child: Text('Page not found!')),
      ),
    );
  }
}
