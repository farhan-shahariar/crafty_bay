import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  Future<bool> addToCart(int productId, String color, String size, int quantity) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().postRequest(url: Urls.addToCart,
      body: {
        "product_id": productId,
        "color": color,
        "size": size,
        "qty": quantity
      }
    );
    if (response.isSuccess && response.responseData['msg'] == 'success') {
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
