import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EarningTabPage extends StatefulWidget {
  const EarningTabPage({super.key});

  @override
  State<EarningTabPage> createState() => _EarningTabPageState();
}

class _EarningTabPageState extends State<EarningTabPage> {
  double totalEarnings = 0.0;
  List<Map<String, dynamic>> tripList = [];

  @override
  void initState() {
    super.initState();
    fetchEarningsData();
  }

  // Fetch earnings data from Firebase
  void fetchEarningsData() async {
    DatabaseReference earningRef = FirebaseDatabase.instance
        .ref()
        .child('drivers')
        .child('YOUR_DRIVER_ID') // Replace with actual driver ID
        .child('earnings');

    // Fetch total earnings
    earningRef.child('totalEarnings').once().then((DatabaseEvent event) {
      if (event.snapshot.exists) {
        setState(() {
          totalEarnings = double.parse(event.snapshot.value.toString());
        });
      } else {
        Fluttertoast.showToast(msg: "No earnings found.");
      }
    });

    // Fetch trip list and earnings per trip
    earningRef.child('trips').onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value as Map?;
      if (data != null) {
        setState(() {
          tripList = data.entries.map((e) {
            final tripData = e.value as Map<String, dynamic>;
            return {
              'date': tripData['date'],
              'amount': tripData['amount'],
              'tripId': tripData['tripId'],
            };
          }).toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(

        title: Text("Earnings"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Total Earnings
              Card(
                color: Colors.lightBlueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Total Earnings",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "\$$totalEarnings",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Trip Earnings
              Expanded(
                child: tripList.isEmpty
                    ? Center(
                  child: Text(
                    "No trips completed.",
                    style: TextStyle(color: Colors.black),
                  ),
                )
                    : ListView.builder(
                  itemCount: tripList.length,
                  itemBuilder: (context, index) {
                    final trip = tripList[index];
                    return Card(
                      color: Colors.black54,
                      child: ListTile(
                        title: Text(
                          "Trip ${trip['tripId']}",
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "Date: ${trip['date']}",
                          style: TextStyle(color: Colors.white54),
                        ),
                        trailing: Text(
                          "\$${trip['amount']}",
                          style: TextStyle(
                              fontSize: 16, color: Colors.lightBlueAccent),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
