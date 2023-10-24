import 'dart:convert';
import 'package:getx_app/app/data/model.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  String apiUrl = 'https://fakestoreapi.com/products';

  Future<List<Product>> getProduct() async {
    var res = await http.get(Uri.parse('$apiUrl'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Product> listProduct =
          body.map((dynamic item) => Product().fromJson(item)).toList();
      return listProduct;
    } else {
      print(res.body.toString());
      throw "Failed to get Product";
    }
  }

  Future<Product> getProductById(String id) async {
    var res = await http.get(Uri.parse('$apiUrl/$id'));
    if (res.statusCode == 200) {
      return Product().fromJson(json.decode(res.body));
    } else {
      print(res.body.toString());
      throw Exception('Failed to load Product');
    }
  }

  Future createProduct(Product product) async {
    var res = await http.post(
      Uri.parse('$apiUrl'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(product.toJson()),
    );
    if (res.statusCode == 200) {
      print(res.body);
    } else {
      print(res.body);
      throw Exception('Failed to post Product');
    }
  }

  Future updateProduct(Product product) async {
    var res = await http.put(
      Uri.parse('$apiUrl/${product.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(product.toJson()),
    );
    if (res.statusCode == 200) {
      print(res.body);
    } else {
      print(res.body);
      throw Exception('Failed to update Product');
    }
  }

  Future deleteProduct(String id) async {
    var res = await http.get(Uri.parse('$apiUrl/$id'));
    if (res.statusCode == 200) {
      print(res.body);
    } else {
      print(res.body);
      throw Exception('Failed to delete a Product');
    }
  }
}
