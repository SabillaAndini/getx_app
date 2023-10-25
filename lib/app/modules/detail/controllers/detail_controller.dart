import 'package:get/get.dart';
import 'package:getx_app/app/data/model.dart';
import 'package:getx_app/app/data/service_api.dart';

class DetailController extends GetxController {
  //TODO: Implement DetailController
  RxList<Product> listProduct = <Product>[].obs;

  final ServiceApi serviceApi = ServiceApi();

  Future<List<Product>> loadProduct() async {
    return listProduct.value = await serviceApi.getProduct();
  }

  Future<void> deleteProduct(Product product) async {
    try {
      await serviceApi.deleteProduct(product.id.toString());
      Get.snackbar('Success', 'Product berhasil dihapus');
    } catch (e) {
      print(e);
    }
  }
}
