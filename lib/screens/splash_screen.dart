import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.contain,
                    height: 200,
                  ),
                  Text(
                    "Travel Agency",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 78.0),
                  //   child: IconButton(
                  //     // onPressed: (() => print('go to headline')),
                  //     onPressed: (() => Navigator.of(context).pushNamed('/home')),
                  //     icon: Icon(Icons.arrow_forward),
                  //     iconSize: 60.0,
                  //     color: Colors.pink[300],
                  //   ),
                  // ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Powered By Anh Tuan",
                    style: TextStyle(fontSize: 15, color: Colors.black45),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    goToNextScreen();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future goToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, '/main');
  }
}
