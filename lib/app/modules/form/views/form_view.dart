import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/form_controller.dart';

class FormView extends StatelessWidget {
  final FormController formController = Get.put(FormController());

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/fake store logo.png',
                width: 40,
                height: 40,
              ),
            ),
            const Text(
              'Fake Store',
              style: TextStyle(
                color: Color(0xFF802c6e),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Container(
            width: 300,
            height: 200,
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 2,
                  color: Color.fromARGB(255, 223, 222, 222),
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                'assets/formimage.png',
                scale: 5,
              ),
            ),
          ),
          SizedBox(height: 16), // Spasi antara tombol dan teks
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xff802c6e),
                width: 2.0,
              ), // Menambahkan border
              borderRadius:
                  BorderRadius.circular(30), // Menambahkan border radius
            ),
            child: TextButton(
              onPressed: () {
                // Tindakan yang ingin Anda lakukan ketika tombol teks ditekan
              },
              style: TextButton.styleFrom(
                primary: Color(0xff802c6e), // Warna teks
              ),
              child: Text('Upload Image'),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    key: Key('productNameField'), // Tambahkan Key
                    controller: productNameController,
                    decoration: InputDecoration(labelText: 'Product Name'),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    key: Key('productPriceField'), // Tambahkan Key
                    controller: productPriceController,
                    decoration: InputDecoration(labelText: 'Product Price'),
                    keyboardType: TextInputType
                        .number, // Tambahkan keyboard type untuk input harga
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      String productName = productNameController.text;
                      double productPrice =
                          double.tryParse(productPriceController.text) ?? 0.0;

                      formController.addProduct(productName, productPrice);

                      productNameController.clear();
                      productPriceController.clear();
                    },
                    child: Text('Add Product'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
