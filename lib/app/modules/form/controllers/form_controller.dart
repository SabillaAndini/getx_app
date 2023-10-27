import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/data/service_api.dart';
import 'package:getx_app/app/data/model.dart';

class FormController extends GetxController {
  ServiceApi serviceApi = ServiceApi();

  TextEditingController productNameController = TextEditingController();
  TextEditingController productCategoryController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();

  String selectedCategory =
      'electronics'; // Buat variabel untuk menyimpan kategori yang dipilih.
  final items = [
    'electronics',
    'jewelery',
    "men's clothing",
    "women's clothing",
  ];

  bool checkIsDouble(String? text) {
    try {
      double.parse(text ?? '');
      return true;
    } catch (e) {
      return false;
    }
  }

  modelToController(Product product) {
    productNameController.text = product.title ?? '';
    selectedCategory = product.category ?? '';
    productPriceController.text = (product.price ?? '').toString();
    productDescriptionController.text = product.description ?? '';
  }

  controllerToModel(Product product) {
    product.title = productNameController.text;
    product.category = productCategoryController.text;
    product.price = double.tryParse(productPriceController.text);
    product.description = productDescriptionController.text;
    return product;
  }

  Future storeProduct(Product product, bool isUpdate) async {
    try {
      product = controllerToModel(product);
      isUpdate == false
          ? await serviceApi.createProduct(product)
          : await serviceApi.updateProduct(product);
      Get.back();
      Get.snackbar('Success', 'Product berhasil disimpan');
    } catch (e) {
      print(e.toString());
    }
  }
}
