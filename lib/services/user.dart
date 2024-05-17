import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ecommerce_app/utils/constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class UserServices {
  final box = GetStorage();
  Future<UserModel> login(
      {required String username, required String password}) async {
    var data = {"username": username, "password": password};
    var response = await http.post(
      Uri.parse("$kEndpoint/user/login"),
      body: jsonEncode(data),
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      log(json.toString());
      await saveUser(UserModel.fromJson(json["data"]));
      return UserModel.fromJson(json["data"]);
    } else {
      final json = jsonDecode(response.body);
      throw json["error"];
    }
  }

  saveUser(UserModel user) {
    box.remove(kUserInfo);
    box.write(kUserInfo, user.toJson());
  }
}
