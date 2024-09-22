import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notifications',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Placeholder for actual notification count
                itemBuilder: (context, index) {
                  return NotificationTile(
                    title: 'Notification ${index + 1}',
                    description: 'This is a sample notification ${index + 1}.',
                    time: '12:${index + 1} PM',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String description;
  final String time;

  NotificationTile({
    required this.title,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        leading: Icon(
          Icons.notifications,
          color: Colors.blueAccent,
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        subtitle: Text(
          description,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.black54),
        ),
        trailing: Text(
          time,
          style: TextStyle(color: Colors.grey),
        ),
        onTap: () {
          // Handle tile tap action
        },
      ),
    );
  }
}
