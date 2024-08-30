import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(

            children: [
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("assets/images/logo1.png"),
              ),

              SizedBox(height: 10,),
              Text("Register as a Driver",style: TextStyle(
                fontSize: 24,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 10,),


              TextField(
                controller: nameTextEditingController,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Name",

                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                  ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
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
              SizedBox(height: 10,),

              TextField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Email",

                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
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
              SizedBox(height: 10,),

              TextField(
                controller: phoneTextEditingController,
                keyboardType: TextInputType.phone,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  labelText: "Phone",
                  hintText: "phone",

                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
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
              SizedBox(height: 10,),

              TextField(
                controller: passwordTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Password",

                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
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
              SizedBox(height: 30,),





              ElevatedButton(onPressed: (){},
                  style:  ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                  child: Text("Create account",style: TextStyle(
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
