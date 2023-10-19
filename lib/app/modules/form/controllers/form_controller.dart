import 'package:get/get.dart';

class FormController extends GetxController {
  final RxList<Product> products = <Product>[].obs;

  void addProduct(
      String name, String category, double price, String description) {
    final product = Product(
        name: name, category: category, price: price, description: description);
    products.add(product);
  }
}

class Product {
  final String name;
  final String category;
  final double price;
  final String description;

  Product(
      {required this.name,
      required this.category,
      required this.price,
      required this.description});
}
