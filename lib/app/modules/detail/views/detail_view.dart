import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/data/model.dart';
import 'package:getx_app/app/modules/detail/controllers/detail_controller.dart';
import '../../../routes/app_pages.dart';

class DetailView extends StatefulWidget {
  DetailView({Key? key}) : super(key: key);

  Product product = Get.arguments ?? Product();
  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
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
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 15)),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 340,
                height: 210,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.50),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Image.network(
                    widget.product.image ?? '',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.product.title ?? "",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: 'Poppins Bold',
                            ),
                            maxLines: 2, // Maksimum 2 baris
                            overflow: TextOverflow
                                .ellipsis, // Menggunakan tanda elipsis jika terlalu panjang
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        for (var i = 0; i < 5; i++)
                          Icon(
                            Icons.star,
                            color:
                                i < ((widget.product.rating?.rate ?? 0).round())
                                    ? const Color.fromARGB(255, 255, 217, 0)
                                    : Colors.grey,
                            size: 17,
                          ),
                        const SizedBox(width: 8),
                        Text(
                          '${widget.product.rating?.rate}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 1,
                          height: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${widget.product.rating?.count}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  '\$${widget.product.price ?? ""}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontFamily: 'Poppins Bold',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Product Details',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  widget.product.description ?? "",
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontFamily: 'Poppins Light',
                    height: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            //category
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                width: 100,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xff802c6e)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.sell_rounded,
                      color: Color(0xff802c6e),
                      size: 10,
                    ),
                    Text(
                      '${widget.product.category ?? ""}',
                      style: TextStyle(
                        fontFamily: 'Poppins Regular',
                        color: Color(0xff802c6e),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Get.toNamed(Routes.FORM, arguments: widget.product);
            },

            backgroundColor: Colors.yellow, // Ganti warna sesuai kebutuhan
            child: const Icon(Icons.edit),
          ),
          const SizedBox(
            height: 16,
          ), // Jarak vertikal antara tombol Edit dan tombol Delete
          FloatingActionButton(
            onPressed: () {
              Get.dialog(
                Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 110,
                          decoration: const BoxDecoration(
                            color: Color(0xffF2D2EB),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.only(top: 5, bottom: 10),
                                child: Icon(
                                  Icons
                                      .help_outline, // Ganti dengan ikon "help_outline"
                                  size: 100,
                                  color: Color(0xff802c6e),
                                ),
                              ),
                            ),
                            const SizedBox(height: 17),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: const Text(
                                'Are you sure?',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xff802c6e),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: const Text(
                                'Do you really want to delete this product? You will not be able to undo this action!',
                                style: TextStyle(
                                  fontFamily: 'Poppins Regular',
                                  color: Color(0xff802c6e),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    side: const BorderSide(
                                      color: Color(0xff802c6e),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    fixedSize: const Size(100, 15),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text(
                                    'No',
                                    style: TextStyle(
                                      fontFamily: 'Poppins Regular',
                                      color: Color(0xff802c6e),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff802c6e),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    minimumSize: const Size(100,
                                        40), // Atur ukuran minimum yang sesuai
                                  ),
                                  onPressed: () {
                                    DetailController controller =
                                        Get.find<DetailController>();
                                    controller.deleteProduct(widget.product);
                                  },
                                  child: const Text(
                                    'Yes',
                                    style: TextStyle(
                                      fontFamily: 'Poppins Regular',
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.delete_forever),
          )
        ],
      ),
    );
  }
}
