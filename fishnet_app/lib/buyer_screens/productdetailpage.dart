import 'package:flutter/material.dart';
import 'package:fishnet_app/buyer_screens/CheckoutPage.dart';

class ProductDetailPage extends StatelessWidget {
  final String productName;
  final int productPrice;
  final String productDescription;
  final String productImage; // Change IconData to String
  final List<String> productReviews;
  final String sellerName;

  ProductDetailPage({
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productImage,
    required this.productReviews,
    required this.sellerName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text(productName),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildProductImage(),
            const SizedBox(height: 16),
            _buildProductTitle(context),
            const SizedBox(height: 8),
            _buildProductPrice(context),
            const SizedBox(height: 20),
            _buildProductDescription(),
            const SizedBox(height: 20),
            _buildReviewsSection(),
            const SizedBox(height: 20),
            _buildSellerInfo(context),
            const SizedBox(height: 20),
            _buildCheckoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue[100],
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: ClipOval(
          child: Image.asset(
            productImage,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildProductTitle(BuildContext context) {
    return Center(
      child: Text(
        productName,
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.075,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildProductPrice(BuildContext context) {
    return Center(
      child: Text(
        '\$$productPrice',
        style: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.065,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _buildProductDescription() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              productDescription,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Reviews',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: productReviews
                  .map((review) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.star, color: Colors.yellow, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                review,
                                style: const TextStyle(fontSize: 16, color: Colors.black54),
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSellerInfo(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Logic to view seller's profile
              },
              child: Text(
                'Seller: $sellerName',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Make it clickable
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Logic to open messaging screen
                  },
                  child: Text('Message'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Logic to follow the seller
                  },
                  child: Icon(Icons.person_add), // Use icon for follow
                ),
                PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('Option 1'),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text('Option 2'),
                      value: 2,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckoutButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckoutPage(
                productName: productName,
                productPrice: productPrice,
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.blue,
        ),
        child: const Text(
          'Check Out',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
