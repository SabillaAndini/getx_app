import 'package:get/get.dart';

class FormController extends GetxController {
  final RxList<Product> products = <Product>[].obs;

  void addProduct(String name, double price) {
    final product = Product(name: name, price: price);
    products.add(product);
  }
}

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}
