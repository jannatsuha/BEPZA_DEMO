import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/data/datasource/remote/dio/dio_client.dart';
import 'package:tutorial/data/datasource/remote/exception/api_error_handler.dart';
import 'package:tutorial/data/model/response/base/api_response.dart';
import 'package:tutorial/util/app_constant.dart';

class AuthRepo{
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({@required this.dioClient,this.sharedPreferences});



  Future<ApiResponse> login({String email, String password}) async {
    try {
      Response response = await dioClient.post(
        AppConstant.LOGIN_URI,
        data: {"email": email, "password": password},
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // Future<ApiResponse> directLogin() async {
  //   try {
  //     Response response = await dioClient.get(
  //       AppConstant.TOKOEN_URI,
  //     );
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }


  // for  user token
  // Future<void> saveUserToken(String token) async {
  //   dioClient.token = token;
  //   dioClient.dio.options.headers = {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'};
  //
  //   try {
  //     await sharedPreferences.setString(AppConstant.TOKEN, token);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  String getUserToken() {
    return sharedPreferences.getString(AppConstant.TOKEN) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstant.TOKEN);
  }

  Future<bool> clearSharedData() async {
    await sharedPreferences.remove(AppConstant.TOKEN);
    return true;
  }


}