import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'package:getx_app/app/data/model.dart';

class HomeView extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());
  Product product = Get.arguments ?? Product();

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
                  color: Color.fromARGB(255, 128, 44, 110),
                  fontFamily: 'Poppins Bold',
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: 200,
                  height: 50,
                  child: TextField(
                    autocorrect: false,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      labelText: 'Search Product',
                      labelStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.grey,
                      ),
                      suffixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xff802c6e),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: 100,
                  height: 36,
                  child: TextField(
                    autocorrect: false,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      labelText: 'Filter',
                      labelStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.grey,
                      ),
                      suffixIcon: const Icon(Icons.filter_alt_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xff802c6e),
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: controller.loadProducts(),
              builder: (context, snapshot) => (snapshot.connectionState ==
                      ConnectionState.waiting)
                  ? const Center(child: CircularProgressIndicator())
                  : Container(
                      height: Get.height * 0.8,
                      child: GridView.builder(
                        key: UniqueKey(),
                        padding: const EdgeInsets.all(20),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 6.5 / 9,
                          crossAxisCount: 2,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                        ),
                        itemCount: controller.listProduct.value.length,
                        itemBuilder: (context, index) {
                          final product = homeController.listProduct[index];

                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.DETAIL,
                                  arguments: controller.listProduct[index]);
                            },
                            child: Container(
                              height: 400,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 4,
                                    spreadRadius: 1,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Image.network(
                                      product.image ?? "",
                                      width: 100,
                                      height: 125,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 7, left: 7),
                                    child: Text(
                                      product.title ?? '',
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: 'Poppins Bold',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 7, left: 7),
                                    child: Text(
                                      product.description ?? "",
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: 'Poppins',
                                        fontSize: 13,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 7, right: 7),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\$${(product.price ?? 0).toStringAsFixed(2)}',
                                          style: const TextStyle(
                                            fontFamily: 'Poppins Bold',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 16,
                                            ),
                                            Text(
                                              '${product.rating?.rate.toString()}',
                                              style: const TextStyle(
                                                fontFamily: 'Poppins Medium',
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(190, 40),
                  backgroundColor: const Color(0xff802c6e),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  //controller.addProduct("New Product");
                  Get.toNamed(Routes.FORM);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Add New Product',
                      style: TextStyle(
                        fontFamily: 'Poppins Bold',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.add_circle_outline_rounded,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
