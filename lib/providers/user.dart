import 'package:ecommerce_app/models/user_model.dart';
import 'package:ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../services/user.dart';

enum LoginState { normal, loading, error, networkError, success }

class UserProvider extends ChangeNotifier {
  UserModel user = UserModel();
  LoginState loginState = LoginState.normal;
  final box = GetStorage();
  login({
    required String username,
    required String password,
    Function(UserModel)? onSuccess,
    Function(String)? onError,
  }) async {
    try {
      loginState = LoginState.loading;
      notifyListeners();
      user = await UserServices().login(username: username, password: password);
      loginState = LoginState.success;
      notifyListeners();
      if (onSuccess != null) {
        onSuccess(user);
      }
    } catch (e) {
      loginState = LoginState.error;
      notifyListeners();
      if (onError != null) {
        onError(e.toString());
      }
    }
  }

  getUser() {
    if (box.hasData(kUserInfo)) {
      final json = box.read(kUserInfo);
      if (json != null) {
        user = UserModel.fromJson(json);
        notifyListeners();
      }
    }
  }
}
