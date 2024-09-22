import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], // Background color to match the theme
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0, // Remove elevation for a flat look
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://example.com/profile-pic.jpg'), // Replace with a valid image URL
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Juan Dela Cruz',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildProfileInfo('Email:', 'JuanDelaCruz@gmail.com'),
            SizedBox(height: 20),
            _buildProfileInfo('Phone:', '+123 456 7890'),
            SizedBox(height: 20),
            _buildProfileInfo('Address:', '123 Main Street\nCity, State, ZIP'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo(String title, String info) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        Expanded(
          child: Text(
            info,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
