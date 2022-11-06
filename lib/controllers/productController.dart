import 'package:furniture_app/models/apiModel.dart';
import 'package:furniture_app/services/remote_services.dart';
import 'package:get/get.dart';


class ProductController extends GetxController{
  var isLoading = true.obs;
  var productList = <ProductData>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProducts();
    super.onInit();
  }


  void fetchProducts() async{
    try {
      isLoading(true);
      var res = await RemoteService.fetchProducts();
      if(res != null) productList.value = res;
      isLoading(false);
    } finally {
      // TODO
      isLoading(false);
    }
  }
}