import 'package:flutter/material.dart';
import 'dart:async';

import 'package:uas_frontend_gs2223_72200441/homedrawer.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key, required this.title});

  final String title;

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  startSplashscreen() async {
    var duration = new Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homedrawer())
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "images/logo.png",
          width: 100.0,
          height: 100.0,
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    startSplashscreen();
  }
}