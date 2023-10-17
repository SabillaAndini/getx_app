import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            )
          ],
        ),
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
                hintText: 'search product',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
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
                      final itemImage = controller.getItemImages()[index];
                      return GridItemWidget(
                        item: controller.filteredItems[index],
                        imageAssetPath: itemImage,
                      );
                    },
                  ),
                  Positioned(
                    bottom: 24.0, // Perbesar jarak dari bawah
                    right: 16.0,
                    child: ElevatedButton(
                      onPressed: () {
                        // Tambahkan logika untuk menambahkan produk di sini
                        controller.addProduct("New Product");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(0xFF802c6e), // Warna latar belakang ungu
                        minimumSize: Size(160, 48), // Mengatur tinggi tombol
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // Mengatur ikon di sebelah kanan
                        children: [
                          Text(
                            "Add New Product",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 8), // Tambahkan jarak horizontal
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white, // Warna outline
                              ),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white, // Warna ikon
                            ),
                          ),
                        ],
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
  final String imageAssetPath; // Tambahkan properti untuk path gambar asset

  GridItemWidget({required this.item, required this.imageAssetPath});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            imageAssetPath, // Menggunakan path gambar asset dari properti
            fit: BoxFit.cover,
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(item),
          ),
        ],
      ),
    );
  }
}
