import 'dart:async';
import 'package:flutter/material.dart';
import 'webview/webview.dart';
import 'onboard.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool openSplashScreen = true;
  bool showLoadingPage = false;
  late double screenWidth, screenHeight;
  final Duration duration = const Duration(seconds: 5);
  late AnimationController _controller;
    String _url2 = "https://dabidrinkmasstrade.abyssiniasoftware.com/";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);

    Future.delayed(duration, () {
      setState(() {
        openSplashScreen = false;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
// overide
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return SafeArea(
      child: Scaffold(
        body: AnimatedSwitcher(
          duration: duration,
          child: openSplashScreen
              ? Container(
                  height: screenHeight,
                  width: screenWidth,
                  color: Colors.green,
                  child: Image.asset('assets/images/lg2.png',
                           height: screenHeight,
                           width: screenWidth,
                           ))
              : OnboardingScreen(),
        ),
      ),
    );
  }
}