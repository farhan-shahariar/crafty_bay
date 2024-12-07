
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utils/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  bool _isProfileCompleted = false;
  bool get isProfileCompleted => _isProfileCompleted;

  Future<bool> getProfileDetails(String token) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(url: Urls.readProfileUrl, token: token);
    if (response.isSuccess) {
      if(response.responseData['data'] != null){
        _isProfileCompleted = true;
        await Get.find<AuthController>().saveAccessToken(token);
      }
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
