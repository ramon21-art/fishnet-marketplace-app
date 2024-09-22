import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
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
              'Recent Messages',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return MessageTile(
                    sender: 'Sender ${index + 1}',
                    message: 'This is a sample message from sender ${index + 1}.',
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

class MessageTile extends StatelessWidget {
  final String sender;
  final String message;
  final String time;

  MessageTile({
    required this.sender,
    required this.message,
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
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Text(
            sender[0],
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          sender,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        subtitle: Text(
          message,
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
