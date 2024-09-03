import 'package:drivers_app/userapp/Authantication/userLogin_screen.dart';
import 'package:flutter/material.dart';

import '../authantication/driverlogin_screen.dart';


class DriverAndUserSelectionScreen extends StatelessWidget {
  const DriverAndUserSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:Colors.black ,
        centerTitle: true,
        title: Text('Choose Role',
            style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // DriverSigInScreen();
                 Navigator.push(context, MaterialPageRoute(builder: (context) => DriverSigInScreen()));
              },
              child: const Text('Register as Driver'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // UserSigInScreen();
                 Navigator.push(context, MaterialPageRoute(builder: (context) => UserSigInScreen()));
              },
              child: const Text('Register as User'),
            ),
          ],
        ),
      ),
    );
  }
}
