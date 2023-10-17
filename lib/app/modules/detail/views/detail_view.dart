import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: 390.0,
            height: 210.81,
            margin: const EdgeInsets.only(top: 80.0),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.25),
                  spreadRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Image.network(
              'https://images.tokopedia.net/img/cache/900/hDjmkQ/2023/5/8/559a8392-4d0a-41af-8b04-0520e3fcc549.jpg', // Ganti dengan URL gambar yang sesuai
              fit: BoxFit.cover, // Menyesuaikan gambar ke dalam kotak
            ),
          ),
          SizedBox(height: 16), // Tambahkan jarak vertikal di sini
          const Center(
            child: Text(
              'DetailView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
