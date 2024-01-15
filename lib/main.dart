import 'package:flutter/material.dart';
import 'package:ramadhan_app/splash.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)),
        debugShowCheckedModeBanner: false,
        home: Splash());
  }
}
