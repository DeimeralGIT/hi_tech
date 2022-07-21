// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:parallax_bg/parallax_bg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hi Tech',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset(
          "assets/app_icon.jpg",
        ),
        curve: Curves.easeInOut,
        nextScreen: const MyHomePage(),
        splashIconSize: 500,
        duration: 1500,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          parallaxBG(),
        ],
      ),
    );
  }

  Widget parallaxBG() {
    return ParallaxBackground(
      backgroundImage: "assets/parallax_bg.jpg",
      foregroundChilds: [
        ParallaxItem(
          child: Image.asset(
            "assets/parallax_bg.jpg",
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    );
  }
}
