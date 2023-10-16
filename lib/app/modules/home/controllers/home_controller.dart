import 'package:get/get.dart';

class HomeController extends GetxController {
  final allItems = <String>[
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'item 5',
    'item 6'
  ];
  final filteredItems = <String>[].obs;

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
}
