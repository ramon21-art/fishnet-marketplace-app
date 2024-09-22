import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProductPage extends StatefulWidget {
  final String initialTypeOfFish;
  final String initialLocation;
  final double initialPrice;
  final double initialKilo;

  EditProductPage({
    required this.initialTypeOfFish,
    required this.initialLocation,
    required this.initialPrice,
    required this.initialKilo,
  });

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final ImagePicker _picker = ImagePicker();
  late TextEditingController typeController;
  late TextEditingController locationController;
  late TextEditingController priceController;
  late TextEditingController kiloController;

  @override
  void initState() {
    super.initState();
    typeController = TextEditingController(text: widget.initialTypeOfFish);
    locationController = TextEditingController(text: widget.initialLocation);
    priceController = TextEditingController(text: widget.initialPrice.toString());
    kiloController = TextEditingController(text: widget.initialKilo.toString());
  }

  @override
  void dispose() {
    typeController.dispose();
    locationController.dispose();
    priceController.dispose();
    kiloController.dispose();
    super.dispose();
  }

  Future<void> _pickImageOrVideo(BuildContext context) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Picked file: ${pickedFile.path}')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No file selected')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView( // Added for scrollable content
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () => _pickImageOrVideo(context),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_photo_alternate, size: 50, color: Colors.black),
                      SizedBox(height: 8),
                      Text('EDIT PHOTO/VIDEO', style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildTextField('TYPE OF FISH', typeController),
            SizedBox(height: 20),
            _buildTextField('LOCATION', locationController),
            SizedBox(height: 20),
            _buildNumericTextField('PRICE', priceController),
            SizedBox(height: 20),
            _buildNumericTextField('KILO', kiloController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double? price = double.tryParse(priceController.text);
                double? kilo = double.tryParse(kiloController.text);

                if (price != null && kilo != null) {
                  // Handle product edit update logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Product details updated successfully!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter valid numeric values for price and kilo.')),
                  );
                }
              },
              child: Text('SAVE CHANGES'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text}) {
    return Container(
      width: double.infinity, // Full width for text fields
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          labelText: labelText,
        ),
      ),
    );
  }

  Widget _buildNumericTextField(String labelText, TextEditingController controller) {
    return Container(
      width: double.infinity, // Full width for numeric text fields
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          labelText: labelText,
        ),
      ),
    );
  }
}
