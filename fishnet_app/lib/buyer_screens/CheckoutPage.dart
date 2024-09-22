import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final String productName;
  final int productPrice;

  CheckoutPage({required this.productName, required this.productPrice});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String _selectedPaymentMethod = 'GCash';
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _gcashNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], // Background color to match the theme
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.blue,
        elevation: 0, // Remove elevation for a flat look
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Order Summary',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.productName,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '\$${widget.productPrice}',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Shipping Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), // Match rounded corners
                  ),
                  filled: true,
                  fillColor: Colors.blue[100], // Match the theme
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Payment Method',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Radio<String>(
                    value: 'GCash',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethod = value!;
                      });
                    },
                  ),
                  Text('GCash', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 20),
                  Radio<String>(
                    value: 'COD',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethod = value!;
                      });
                    },
                  ),
                  Text('Cash on Delivery', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 20),
              if (_selectedPaymentMethod == 'GCash') ...[
                TextField(
                  controller: _gcashNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'GCash Mobile Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15), // Match rounded corners
                    ),
                    filled: true,
                    fillColor: Colors.blue[100], // Match the theme
                  ),
                ),
                SizedBox(height: 20),
              ],
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Perform validation
                    if (_addressController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter your address')),
                      );
                      return;
                    }

                    if (_selectedPaymentMethod == 'GCash' &&
                        _gcashNumberController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter your GCash number')),
                      );
                      return;
                    }

                    // Confirm purchase action
                    String confirmationMessage = _selectedPaymentMethod == 'GCash'
                        ? 'Purchase confirmed using GCash!'
                        : 'Purchase confirmed using Cash on Delivery!';

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(confirmationMessage)),
                    );

                    // Navigate back to the product list or home page after checkout
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  child: Text(
                    'Confirm Purchase',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
