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
  String? name;
  String? category;
  double? price;
  String? description;

  Product({this.name, this.category, this.price, this.description});
}
