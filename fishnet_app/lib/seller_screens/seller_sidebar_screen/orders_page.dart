import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  // Sample data for orders
  final List<Order> orders = [
    Order(id: '001', productName: 'Fish A', quantity: 2, status: 'Shipped'),
    Order(id: '002', productName: 'Fish B', quantity: 1, status: 'Pending'),
    Order(id: '003', productName: 'Fish C', quantity: 5, status: 'Delivered'),
    // Add more orders as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0, // Flat look
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  labelText: 'Search Orders',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  // Implement search logic
                },
              ),
            ),
            SizedBox(height: 16),
            // List of orders
            Expanded(
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.0),
                      title: Text(
                        'Order ID: ${order.id}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Product: ${order.productName}'),
                          Text('Quantity: ${order.quantity}'),
                          Text('Status: ${order.status}'),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.blue,
                      ),
                      onTap: () {
                        // Navigate to order details page or handle tap
                      },
                    ),
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

class Order {
  final String id;
  final String productName;
  final int quantity;
  final String status;

  Order({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.status,
  });
}
