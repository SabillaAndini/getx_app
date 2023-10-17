import 'package:get/get.dart';

class HomeController extends GetxController {
  final allItems = <String>[
    'Seventeen T-Shirt',
    'Tote Bag',
    'ADIOLI Men Sweater',
    'Nike futura washed h86 cap',
    'Converse',
    'Women Marhen.j Canvas Tote Bag'
  ];
  final filteredItems = <String>[].obs;
  final itemImages = <String>[
    'assets/item1.png',
    'assets/item2.png',
    'assets/item3.png',
    'assets/item4.png',
    'assets/item5.png',
    'assets/item6.png',
  ];

  @override
  void onInit() {
    filteredItems.assignAll(allItems);
    super.onInit();
  }

  void filterData(String query) {
    if (query.isEmpty) {
      filteredItems.assignAll(allItems);
    } else {
      final filtered = allItems.where((item) => item.contains(query)).toList();
      filteredItems.assignAll(filtered);
    }
  }

  void addProduct(String s) {}

  void applyFilter(String value) {}

  List<String> getItemImages() {
    return itemImages;
  }
}
