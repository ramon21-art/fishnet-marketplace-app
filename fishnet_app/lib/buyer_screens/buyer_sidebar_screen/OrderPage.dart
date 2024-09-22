import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data for the orders
    final orders = [
      {
        'productName': 'Product 1',
        'orderStatus': 'Delivered',
        'price': '\$30',
        'orderDate': '2024-09-01'
      },
      {
        'productName': 'Product 2',
        'orderStatus': 'In Transit',
        'price': '\$45',
        'orderDate': '2024-09-10'
      },
      {
        'productName': 'Product 3',
        'orderStatus': 'Pending',
        'price': '\$20',
        'orderDate': '2024-09-15'
      },
    ];

    return Scaffold(
      backgroundColor: Colors.blue[50], // Background color to match the theme
      appBar: AppBar(
        title: Text('My Orders'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0, // Remove elevation for a flat look
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                title: Text(
                  order['productName']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Status: ${order['orderStatus']}',
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text(
                      'Order Date: ${order['orderDate']}',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
                trailing: Text(
                  order['price']!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
