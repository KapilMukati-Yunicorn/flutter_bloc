import 'dart:async';

import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.white, spreadRadius: 22),
              BoxShadow(color: Colors.green, spreadRadius: 20),
              BoxShadow(color: Colors.orange, spreadRadius: 10),
            ],
          ),
          child: Center(
            child: Text(
              "Splash Screen",
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 30,
                shadows: [Shadow(color: Colors.grey, offset: Offset(0, -1.5))],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
