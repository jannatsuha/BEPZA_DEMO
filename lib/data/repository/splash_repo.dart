import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/data/datasource/remote/dio/dio_client.dart';
import 'package:tutorial/data/datasource/remote/exception/api_error_handler.dart';
import 'package:tutorial/data/model/response/base/api_response.dart';
import 'package:tutorial/util/app_constant.dart';

class SplashRepo{
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  SplashRepo({this.dioClient,this.sharedPreferences});
//stream
  Future<ApiResponse> getConfig() async {
    try {
      final response = await dioClient.get(AppConstant.TOKOEN_URI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<void> saveUserToken(String token) async {
    dioClient.token = token;
    dioClient.dio.options.headers = {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'};

    try {
      await sharedPreferences.setString(AppConstant.TOKEN, token);
    } catch (e) {
      throw e;
    }
  }

}