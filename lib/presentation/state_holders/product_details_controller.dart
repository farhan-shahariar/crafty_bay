import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/product_details_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  ProductDetailsModel? _productModel;
  ProductDetailsModel? get productModel => _productModel;
  Future<bool> getProductDetails(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: Urls.productDetails(productId));
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
      _productModel =
          ProductDetailsModel.fromJson(response.responseData['data'][0]);
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
