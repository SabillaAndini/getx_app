import 'package:get/get.dart';

class HomeController extends GetxController {
  var products = <Product>[].obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();

    products.addAll([
      Product(
        id: 1,
        title: 'Seventeen T-Shirt',
        price: 24.00,
        description: 'Comfortable and stylish T-shirt',
        category: 'Category T-shirt',
        image: 'assets/item1.png',
        rating: Rating(rate: 4.2, count: 500),
      ),
      Product(
        id: 2,
        title: 'Tote Bag Seventeen',
        price: 10.5,
        description: 'Spacious and durable tote bag',
        category: 'Category Tote Bag',
        image: 'assets/item2.png',
        rating: Rating(rate: 4.3, count: 300),
      ),
      Product(
        id: 3,
        title: 'ADIOLI Men Sweater',
        price: 75.39,
        description: 'Warm and trendy sweater',
        category: 'Category Sweater',
        image: 'assets/item3.png',
        rating: Rating(rate: 4.9, count: 350),
      ),
      Product(
        id: 4,
        title: 'Nike futura washed h86 cap',
        price: 49.99,
        description: 'Sporty cap for outdoor activities',
        category: 'Category Cap',
        image: 'assets/item4.png',
        rating: Rating(rate: 4.6, count: 200),
      ),
      Product(
        id: 5,
        title: 'Converse',
        price: 90.9,
        description: 'Classic canvas sneakers',
        category: 'Category Shoes',
        image: 'assets/item5.png',
        rating: Rating(rate: 4.7, count: 700),
      ),
      Product(
        id: 6,
        title: 'Women Marhen.j Canvas Tote Bag',
        price: 70.5,
        description: 'Elegant and roomy tote bag',
        category: 'Category Tote Bag',
        image: 'assets/item6.png',
        rating: Rating(rate: 4.9, count: 378),
      ),
    ]);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void addProduct(String s) {}
}

class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });
}

class Rating {
  double? rate;
  int? count;

  Rating({
    this.rate,
    this.count,
  });
}
