import 'package:drivers_app/SplashScreen/splash_screen.dart';
import 'package:drivers_app/global/global.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({super.key});

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  TextEditingController vehicalModelTextEditingController = TextEditingController();
  TextEditingController vehicalNumberTextEditingController = TextEditingController();
  TextEditingController vehicalColorTextEditingController = TextEditingController();

  List<String> vehicalTypeList = ["Uber X", "Uber Go", "Bike"];
  String? selectedvehicalType;

  // Save car info to Firebase
  saveCarInfo() {
    Map vehicalInfo = {
      "vehical color": vehicalColorTextEditingController.text.trim(),
      "vehical number": vehicalNumberTextEditingController.text.trim(),
      "vehical model": vehicalModelTextEditingController.text.trim(),
      "vehical type": selectedvehicalType,
    };

    DatabaseReference driveRef = FirebaseDatabase.instance.ref().child("drivers");
    driveRef.child(currentFirebaseUser!.uid).child("Vehical_details").set(vehicalInfo);

    Fluttertoast.showToast(msg: "Vehicle details saved successfully.");
    Navigator.push(context, MaterialPageRoute(builder: (context) => MySplashScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // App logo
              Center(
                child: Image.asset("assets/images/logo1.png", height: 100),
              ),
              SizedBox(height: 20),

              // Title
              Text(
                "Register Your Vehicle",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),

              // Form container
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    buildTextField(
                      controller: vehicalModelTextEditingController,
                      label: "Vehicle Model",
                      hint: "Enter vehicle model",
                    ),
                    SizedBox(height: 26),
                    buildTextField(
                      controller: vehicalNumberTextEditingController,
                      label: "Vehicle Number",
                      hint: "Enter vehicle number",
                    ),
                    SizedBox(height: 26),
                    buildTextField(
                      controller: vehicalColorTextEditingController,
                      label: "Vehicle Color",
                      hint: "Enter vehicle color",
                    ),
                    SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      decoration: InputDecoration(
                        labelText: "Vehicle Type",
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlueAccent),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      value: selectedvehicalType,
                      items: vehicalTypeList.map((vehical) {
                        return DropdownMenuItem<String>(
                          value: vehical,
                          child: Text(vehical, style: TextStyle(color: Colors.black)),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedvehicalType = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),

              // Register button
              ElevatedButton(
                onPressed: () {
                  if (vehicalColorTextEditingController.text.isNotEmpty &&
                      vehicalNumberTextEditingController.text.isNotEmpty &&
                      vehicalModelTextEditingController.text.isNotEmpty &&
                      selectedvehicalType != null) {
                    saveCarInfo();
                  } else {
                    Fluttertoast.showToast(msg: "Please fill in all fields.");
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.white,
                  shadowColor: Colors.black,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Register Vehicle",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build TextFields
  TextField buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(color: Colors.black54),
        hintStyle: TextStyle(color: Colors.black38),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black54),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
