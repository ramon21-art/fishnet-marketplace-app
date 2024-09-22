import 'package:flutter/material.dart';

class HelpsAndFAQsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], // Background color to match the theme
      appBar: AppBar(
        title: Text('Helps and FAQs'),
        backgroundColor: Colors.blue,
        elevation: 0, // Remove elevation for a flat look
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildFaqItem(
              'How to create an account?',
              'To create an account, click on the Sign Up button on the home screen and fill in your details.',
            ),
            _buildFaqItem(
              'How to buy products?',
              'To buy products, browse through the marketplace, add items to your cart, and proceed to checkout.',
            ),
            _buildFaqItem(
              'How to contact support?',
              'To contact support, go to the Help section in the app and fill out the contact form.',
            ),
            // Add more FAQs here
          ],
        ),
      ),
    );
  }

  Widget _buildFaqItem(String question, String answer) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ExpansionTile(
        title: Text(
          question,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              answer,
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
