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
          crossAxisAlignment: CrossAxisAlignment
              .start, // Mengubah alignment dari mainAxisAlignment menjadi crossAxisAlignment
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
            SizedBox(height: 10), // Menambahkan spasi
            Container(
              width: 390,
              height: 48,
              child: Text(
                'Seventeen T-Shirt',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            Container(
              width: 54,
              height: 21,
              child: Text(
                '\$109.95',
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
    );
  }
}
