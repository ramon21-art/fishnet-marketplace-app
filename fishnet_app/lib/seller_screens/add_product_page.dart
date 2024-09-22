import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatelessWidget {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageOrVideo(BuildContext context) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      // Handle the picked image/video file (e.g., upload or display it)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Picked file: ${pickedFile.path}')),
      );
    } else {
      // User canceled the picker
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No file selected')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
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
                      Text('PHOTO/VIDEO', style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField('TYPE OF FISH'),
            const SizedBox(height: 20),
            _buildTextField('LOCATION'),
            const SizedBox(height: 20),
            _buildTextField('PRICE', keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            _buildTextField('KILO', keyboardType: TextInputType.number),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle upload action
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Product uploaded successfully!')),
                );
              },
              child: Text('UPLOAD'),
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

  Widget _buildTextField(String labelText, {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        labelText: labelText,
      ),
    );
  }
}
