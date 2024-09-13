import 'package:drivers_app/SplashScreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileTabPage extends StatefulWidget {
  const ProfileTabPage({super.key});

  @override
  State<ProfileTabPage> createState() => _ProfileTabPageState();
}

class _ProfileTabPageState extends State<ProfileTabPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User _user;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser!;
    _user.reload().then((_) {
      setState(() {
        _user = _auth.currentUser!;
      });
    });
  }

  Future<void> _changePassword() async {
    final TextEditingController _passwordController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Password'),
        content: TextField(
          controller: _passwordController,
          decoration: const InputDecoration(
            labelText: 'New Password',
          ),
          obscureText: true,
        ),
        actions: [
          TextButton(
            onPressed: () async {
              try {
                await _user.updatePassword(_passwordController.text.trim());
                Fluttertoast.showToast(msg: 'Password changed successfully');
                Navigator.pop(context);
              } catch (e) {
                Fluttertoast.showToast(msg: 'Error changing password: $e');
              }
            },
            child: const Text('Change'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display Name
            Text(
              'Name: ${_user.displayName ?? ''}',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 10),

            // Email
            Text(
              'Email: ${_user.email ?? ""}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),

            // Change Password Button
            ElevatedButton(
              onPressed: _changePassword,
              child: const Text('Change Password'),
            ),
            const SizedBox(height: 20),

            // Sign Out Button
            ElevatedButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MySplashScreen()),
                );
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}