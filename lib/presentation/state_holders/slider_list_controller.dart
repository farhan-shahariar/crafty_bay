import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/slider_list_model.dart';
import 'package:crafty_bay/data/model/slider_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/utils/urls.dart';

class SliderListController extends GetxController {
  String? _errorMessage;
  bool _inProgress = false;
  List<SliderModel> _sliderList = [];

  String? get errorMessage => _errorMessage;
  bool get inProgress => _inProgress;
  List<SliderModel> get sliders => _sliderList;

  Future<bool> getSliderList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>()
        .getRequest(url: Urls.listProductSliderUrl);
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
      _sliderList =
          SliderListModel.fromJson(response.responseData).sliderList ?? [];
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
