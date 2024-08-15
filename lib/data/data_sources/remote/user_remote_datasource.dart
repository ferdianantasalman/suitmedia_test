import 'dart:convert';

import 'package:suitmedia/core/error/exception.dart';
import 'package:suitmedia/core/resources/constant.dart';
import 'package:suitmedia/core/resources/endpoint.dart';
import 'package:suitmedia/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getAllUser(int page, int perPage);
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource {
  @override
  Future<List<UserModel>> getAllUser(int page, int perPage) async {
    String url = "https://reqres.in/api/users?page=$page&per_page=$perPage";

    // String url =
    // "$baseUrl${Endpoint.api_user_page}$page&${Endpoint.api_per_page}3";

    List<UserModel> listUserModel = [];

    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode != 200) {
        return Future.error(ServerException(
            message: "Get all category failed [${response.statusCode}]"));
      }
      Map<String, dynamic> data = jsonDecode(response.body);

      for (var dt in data["data"]) {
        UserModel userModel = UserModel.fromJson(dt);

        listUserModel.add(userModel);
      }

      return listUserModel;
    } catch (e) {
      return Future.error(const GeneralException(message: "Login gagal"));
    }
  }
}
