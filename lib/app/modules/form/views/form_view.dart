import 'dart:io';
import 'package:getx_app/app/data/model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import '../controllers/form_controller.dart';

class FormView extends StatefulWidget {
  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  Product product = Get.arguments ?? Product();

  final ImagePicker picker = ImagePicker();
  String billa = '';

  getImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        billa = pickedFile.path;
      });
    }
  }

  final FormController formController = Get.put(FormController());
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productCategoryController =
      TextEditingController();
  final TextEditingController productPriceController = TextEditingController();
  final TextEditingController productDescriptionController =
      TextEditingController();
  String?
      selectedCategory; // Buat variabel untuk menyimpan kategori yang dipilih.
  List<String> categories = [
    'T-shirt',
    'Tote Bag',
    'Sweater',
    'Shoes',
    'accessories'
  ];

  @override
  Widget build(BuildContext context) {
    formController.modelToController(product);
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
                color: Color(0xFF802c6e), // Warna teks ungu dengan kode hex
                fontWeight: FontWeight.bold, // Mengatur teks menjadi bold
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              billa != ''
                  ? Container(
                      height: 100,
                      width: 100,
                      child: Image.file(File(billa)),
                    )
                  :
                  // SizedBox(height: 10),
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
                            color: Color(0xFFDDDEDE),
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
              SizedBox(height: 16),
              Container(
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF802c6e),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextButton(
                  onPressed: () {
                    getImage();
                  },
                  style: TextButton.styleFrom(
                    primary: const Color(0xFF802c6e),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 8), // Spasi antara ikon dan teks
                      Text('Upload Image'),
                      Icon(
                        Icons.photo,
                        color: Color(0xFF802c6e),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Container(
                  width: 300,
                  height: 302,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 2,
                        color: Color(0xFFDDDEDE),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: formController.productNameController,
                          validator: (value) => value == null || value == ''
                              ? 'This field is required'
                              : null,
                          decoration: InputDecoration(
                            labelText: 'Product Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: formController.productCategoryController,
                          validator: (value) => value == null || value == ''
                              ? 'This field is required'
                              : null,
                          decoration: InputDecoration(
                            labelText: 'Category',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixIcon: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedCategory,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    // Update the selected category.
                                    formController
                                            .productCategoryController.text =
                                        newValue ??
                                            ''; // Update the TextFormField text.
                                  });
                                },
                                items: categories.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller: formController.productPriceController,
                          validator: (value) => value == null || value == ''
                              ? 'This field is required'
                              : double.tryParse(value) == false
                                  ? 'Wrong Value'
                                  : null,
                          decoration: InputDecoration(
                            labelText: 'Price',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            //keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          controller:
                              formController.productDescriptionController,
                          validator: (value) => value == null || value == ''
                              ? 'This field is required'
                              : null,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  formKey.currentState?.validate() == true
                      ? await formController.storeProduct(
                          product, (product.id != null) ? true : false)
                      : Get.snackbar('Error', 'Data tidak valid');
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF802c6e),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.all(10),
                  maximumSize: const Size(300,
                      70), // Sesuaikan dengan lebar dan tinggi yang Anda butuhkan
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.check_circle_rounded,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
