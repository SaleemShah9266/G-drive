import 'dart:async';

import 'package:drivers_app/authantication/signup_screen.dart';
import 'package:flutter/material.dart';
class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {

  startTimer(){
    Timer(Duration(seconds: 3),() async {
    /// Send user to main screen
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
    } );
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black26,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo1.png" ),
              Text("G Drive", style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),)
      
            ],
          ),
        ),
      ),
    );
  }
}
