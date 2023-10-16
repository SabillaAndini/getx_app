import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              onChanged: (value) {
                controller.filterData(value);
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // GridView
            Expanded(
              child: Stack(
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: controller.filteredItems.length,
                    itemBuilder: (context, index) {
                      return GridItemWidget(
                        item: controller.filteredItems[index],
                      );
                    },
                  ),
                  Positioned(
                    bottom: 16.0,
                    right: 16.0,
                    child: ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika untuk menambahkan produk di sini
                        controller.addProduct("New Product");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.purple, // Warna latar belakang ungu
                      ),
                      child: Text(
                        "Add New Product",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridItemWidget extends StatelessWidget {
  final String item;

  GridItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(item),
      ),
    );
  }
}
