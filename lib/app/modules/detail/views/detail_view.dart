import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/modules/home/controllers/home_controller.dart';

class DetailView extends StatefulWidget {
  DetailView({Key? key}) : super(key: key);
  Product sabilla = Get.arguments ?? Product();
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
                color: Color(0xFF802c6e),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 15)),
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
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Image.network(
                    widget.sabilla.image ?? '',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 75),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.sabilla.title ?? "",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        for (int i = 0; i < 4; i++)
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 14,
                          ),
                        Icon(
                          Icons.star,
                          color: Colors.grey,
                          size: 14,
                        ),
                        Text(
                          '${widget.sabilla.rating?.rate}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 8),
                        Container(
                          width: 1,
                          height: 14,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${widget.sabilla.rating?.count}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 75),
                child: Text(
                  '\$${widget.sabilla.price ?? ""}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 75),
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
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 75),
                child: Text(
                  widget.sabilla.description ?? "",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    height: 1.5,
                  ),
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
              // Tambahkan aksi untuk tombol Edit
            },
            backgroundColor: Colors.yellow, // Ganti warna sesuai kebutuhan
            child: Icon(Icons.edit),
          ),
          SizedBox(
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
                          decoration: BoxDecoration(
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
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 10),
                                child: Icon(
                                  Icons
                                      .help_outline, // Ganti dengan ikon "help_outline"
                                  size: 100,
                                  color: Color(0xff802c6e),
                                ),
                              ),
                            ),
                            SizedBox(height: 17),
                            Container(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Text(
                                'Are you sure?',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color(0xff802c6e),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Text(
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
                                    side: BorderSide(
                                      color: Color(0xff802c6e),
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    fixedSize: Size(100, 15),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                      fontFamily: 'Poppins Regular',
                                      color: Color(0xff802c6e),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff802c6e),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    fixedSize: Size(100, 15),
                                  ),
                                  onPressed: () {
                                    // Tambahkan aksi yang sesuai ketika "Yes" ditekan
                                    // Misalnya, menghapus produk
                                  },
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                      fontFamily: 'Poppins Regular',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
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
            child: Icon(Icons.delete_forever),
          )
        ],
      ),
    );
  }
}
