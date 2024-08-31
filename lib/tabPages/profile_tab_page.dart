import 'package:drivers_app/SplashScreen/splash_screen.dart';
import 'package:flutter/material.dart';

import '../global/global.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({super.key});

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          child: Text("Sign Out"
          ),
        onPressed: (){
          fAuth.signOut();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MySplashScreen()));

        },
      ),
          
       
    );
  }
}
