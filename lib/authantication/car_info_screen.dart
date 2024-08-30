import 'package:flutter/material.dart';

class CarInfoScreen extends StatefulWidget {
  const CarInfoScreen({super.key});

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {
  TextEditingController vehicalModelTextEditingController =
      TextEditingController();
  TextEditingController vehicalNumberTextEditingController =
      TextEditingController();
  TextEditingController vehicalColorTextEditingController =
      TextEditingController();

  List<String> vehicalTypeList = ["Uber x", "Uber go", "Bike"];
  String? selectedvehicalType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("assets/images/logo1.png"),
              ),
              SizedBox(height: 10),
              Text(
                "Vehicle Information",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              // Vehicle Model TextField
              TextField(
                controller: vehicalModelTextEditingController,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  labelText: "Model",
                  hintText: "Model",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Vehicle Number TextField
              TextField(
                controller: vehicalNumberTextEditingController,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  labelText: "Car Number",
                  hintText: "Car Number",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Vehicle Color TextField
              TextField(
                controller: vehicalColorTextEditingController,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  labelText: "Vehicle Color",
                  hintText: "Vehicle Color",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Vehicle Type Dropdown

              SizedBox(
                height: 20,
              ),
              DropdownButton<String>(
                dropdownColor: Colors.white24,
                hint: Text(
                  "Please Choose Vehicle Type",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
                value: selectedvehicalType,
                onChanged: (newValue) {
                  setState(() {
                    selectedvehicalType = newValue;
                  });
                },
                items: vehicalTypeList.map((vehical) {
                  return DropdownMenuItem<String>(
                    child: Text(
                      vehical,
                      style: TextStyle(color: Colors.grey),
                    ),
                    value: vehical,
                  );
                }).toList(),
              ),

              SizedBox(
                height: 30,
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CarInfoScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                ),
                child: Text(
                  "Register Vehical",
                  style: TextStyle(
                    color: Colors.black54,
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
}
