import 'dart:async';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/Components.dart';
import 'package:la_vie/Screens/MobileApp/login_signup_screen.dart';
class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 10), () =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) =>  MobileLoginSignUpScreen()))
    );
    return Scaffold(
        backgroundColor: Colors.white,
        body: FadeIn(
          child: Center(child: Components.mobileLogo()) ,
          duration: Duration(seconds: 3),
        ),
      );
  }
}
