
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/product_list_model.dart';
import 'package:crafty_bay/data/model/product_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:get/get.dart';

class SpecialProductListController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;
  Future<bool> getSpecialProductList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(url: Urls.productListUrl('special'));
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
      _productList =
          ProductListModel.fromJson(response.responseData).productList ?? [];
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
