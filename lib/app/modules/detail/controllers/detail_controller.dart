import 'package:get/get.dart';
import 'package:getx_app/app/data/model.dart';
import 'package:getx_app/app/data/service_api.dart';

class DetailController extends GetxController {
  //TODO: Implement DetailController
  RxList<Product> listUser = <Product>[].obs;

  final ServiceApi serviceApi = ServiceApi();

  Future<List<Product>> loadUsers() async {
    return listUser.value = await serviceApi.getProduct();
  }

  Future<void> deleteUser(Product product) async {
    try {
      await serviceApi.deleteProduct(product.id.toString());
      Get.snackbar('Success', 'User berhasil dihapus');
    } catch (e) {
      print(e);
    }
  }
}
