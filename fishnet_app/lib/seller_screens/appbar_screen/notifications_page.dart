import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], // Background color to match the theme
      appBar: AppBar(
        title: Text('Notifications'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0, // Remove elevation for a flat look
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            _notificationItem("Social Updates", "Free Shipping until this day", 2),
            _notificationItem("Financial Updates", "Payment Due Reminder", 1),
            _notificationItem("Promotions", "Discounts on selected items", 5),
            _notificationItem("Social Updates", "New Follow Requests", 3),
          ],
        ),
      ),
    );
  }

  Widget _notificationItem(String title, String subtitle, int count) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.notifications, color: Colors.white),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.black54),
        ),
        trailing: CircleAvatar(
          radius: 12,
          backgroundColor: Colors.redAccent,
          child: Text(
            count.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
