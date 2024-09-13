import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,  // Adjust width if needed
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 20, 20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center

            children: [
              // Profile section
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/profile_picture.png'), // Replace with actual image path
              ),

              const SizedBox(height: 10),
              const Text(
                'Saleem',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Menu Items
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  Navigator.of(context).pushNamed('/home');  // Add routing logic
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.of(context).pushNamed('/settings');
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('About'),
                onTap: () {
                  Navigator.of(context).pushNamed('/about');
                },
              ),

              // Spacer to push the logout to the bottom
              const Spacer(),

              // Logout option
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  // Add logout functionality
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
