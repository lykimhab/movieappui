import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:movieappui/route/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize WebViewPlatform for Android
  if (WebViewPlatform.instance == null) {
    WebViewPlatform.instance = AndroidWebViewPlatform();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteManager.splash,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
