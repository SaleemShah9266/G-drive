import 'package:flutter/material.dart';

class ProgressDialogue extends StatelessWidget {
  String? message;
  ProgressDialogue({this.message});



  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black54,
      child: Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),

        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              SizedBox(width: 6.0,),
              CircularProgressIndicator(
                valueColor:AlwaysStoppedAnimation<Color>(Colors.green) ,
              ),
              SizedBox(width: 26,),
              Text(
                message!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,

                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}
