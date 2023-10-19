import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Container(
              width: 350,
              height: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 2,
                    color: Color.fromARGB(255, 223, 222, 222),
                  ),
                ],
              ),
              child: Image.asset(
                'assets/item1.png',
                width: 400,
                height: 400,
                scale: 5,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 390,
              height: 48,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Seventeen T-Shirt',
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
                        '4.5',
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
                        '256',
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
            Container(
              width: 54,
              height: 21,
              child: Text(
                '\$24.00',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              width: 93,
              height: 18,
              child: Text(
                'Product Details',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              width: 390,
              height: 30,
              child: Text(
                'Comfortable and stylish T-shirt',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  height: 1.5,
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
              height:
                  16), // Jarak vertikal antara tombol Edit dan tombol Delete
          FloatingActionButton(
            onPressed: () {
              // Tambahkan aksi untuk tombol Delete
            },
            backgroundColor: Colors.red, // Ganti warna sesuai kebutuhan
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
