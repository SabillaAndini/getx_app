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
    productCategoryController.text = product.category ?? '';
    productPriceController.text = (product.price ?? 0.0).toStringAsFixed(2);
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
