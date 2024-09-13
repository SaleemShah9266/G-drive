import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RatingTabPage extends StatefulWidget {
  const RatingTabPage({Key? key}) : super(key: key);

  @override
  _RatingTabPageState createState() => _RatingTabPageState();
}

class _RatingTabPageState extends State<RatingTabPage> {
  double rating = 0.0;
  TextEditingController feedbackController = TextEditingController();

  // Submit rating to Firebase
  void submitRating() {
    if (rating == 0.0) {
      Fluttertoast.showToast(msg: "Please provide a rating.");
      return;
    }

    // Simulate driver and passenger IDs
    String driverId = "currentDriverId"; // Replace with actual driver ID
    String passengerId = "currentPassengerId"; // Replace with actual passenger ID

    // Prepare data for Firebase
    Map<String, dynamic> ratingData = {
      "rating": rating,
      "feedback": feedbackController.text.trim(),
      "timestamp": DateTime.now().toIso8601String(),
    };

    // Save to Firebase
    DatabaseReference ratingRef = FirebaseDatabase.instance
        .ref()
        .child("driverRatings")
        .child(driverId)
        .child(passengerId);

    ratingRef.set(ratingData).then((_) {
      Fluttertoast.showToast(msg: "Rating submitted successfully!");
      setState(() {
        rating = 0.0;
        feedbackController.clear();
      });
    }).catchError((error) {
      Fluttertoast.showToast(msg: "Error: Could not submit rating.");
    });
  }

  // Retrieve ratings from Firebase
  void retrieveRatings() {
    String driverId = "currentDriverId"; // Replace with actual driver ID

    DatabaseReference ratingRef = FirebaseDatabase.instance
        .ref()
        .child("driverRatings")
        .child(driverId);

    ratingRef.once().then((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        Map<String, dynamic> ratings =
        Map<String, dynamic>.from(event.snapshot.value as Map);
        print("Ratings retrieved: $ratings");
      } else {
        Fluttertoast.showToast(msg: "No ratings found.");
      }
    }).catchError((error) {
      Fluttertoast.showToast(msg: "Error: Could not retrieve ratings.");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rate the Passenger"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
             crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),

              // Rating bar
              Text(
                "Rate the Passenger",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (value) {
                  setState(() {
                    rating = value;
                  });
                },
              ),
              SizedBox(height: 20),

              // Feedback TextField
              TextField(
                controller: feedbackController,
                decoration: InputDecoration(
                  labelText: "Feedback",
                  hintText: "Enter your feedback here" ,
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 20),

              // Submit button
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submitRating,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                  child: Text(
                    "Submit Rating",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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

