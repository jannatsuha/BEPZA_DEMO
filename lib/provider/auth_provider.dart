import 'package:flutter/foundation.dart';
import 'package:tutorial/data/model/response/base/api_response.dart';
import 'package:tutorial/data/model/response/base/error_response.dart';
import 'package:tutorial/data/model/response/response_model.dart';
import 'package:tutorial/data/repository/auth_repo.dart';

class AuthProvider with ChangeNotifier{
  final AuthRepo authRepo;

  AuthProvider({this.authRepo});

  // for registration section
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String _registrationErrorMessage = '';

  String get registrationErrorMessage => _registrationErrorMessage;

  updateRegistrationErrorMessage(String message) {
    _registrationErrorMessage = message;
    notifyListeners();
  }

  // Future<ResponseModel> registration(SignUpModel signUpModel) async {
  //   _isLoading = true;
  //   _registrationErrorMessage = '';
  //   notifyListeners();
  //   ApiResponse apiResponse = await authRepo.registration(signUpModel);
  //   ResponseModel responseModel;
  //   if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
  //     Map map = apiResponse.response.data;
  //     String token = map["token"];
  //     authRepo.saveUserToken(token);
  //
  //     responseModel = ResponseModel(true, 'successful');
  //   } else {
  //     String errorMessage;
  //     if (apiResponse.error is String) {
  //       errorMessage = apiResponse.error.toString();
  //     } else {
  //       ErrorResponse errorResponse = apiResponse.error;
  //       errorMessage = errorResponse.errors[0].message;
  //     }
  //     print(errorMessage);
  //     _registrationErrorMessage = errorMessage;
  //     responseModel = ResponseModel(false, errorMessage);
  //   }
  //   _isLoading = false;
  //   notifyListeners();
  //   return responseModel;
  // }

  // for login section
  // String _loginErrorMessage = '';
  // String get loginErrorMessage => _loginErrorMessage;
  //
  // Future<ResponseModel> login(String email, String password) async {
  //   _isLoading = true;
  //   _loginErrorMessage = '';
  //   notifyListeners();
  //   ApiResponse apiResponse = await authRepo.login(email: email, password: password);
  //   ResponseModel responseModel;
  //   if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
  //     Map map = apiResponse.response.data;
  //     String token = map["token"];
  //     authRepo.saveUserToken(token);
  //     responseModel = ResponseModel(true, 'successful');
  //   } else {
  //     String errorMessage;
  //     if (apiResponse.error is String) {
  //       errorMessage = apiResponse.error.toString();
  //     } else {
  //       errorMessage = apiResponse.error.errors[0].message;
  //     }
  //     print(errorMessage);
  //     _loginErrorMessage = errorMessage;
  //     responseModel = ResponseModel(false, errorMessage);
  //   }
  //   _isLoading = false;
  //   notifyListeners();
  //   return responseModel;
  // }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  Future<bool> clearSharedData() async {
    return await authRepo.clearSharedData();
  }
  String getUserToken() {
    return authRepo.getUserToken();
  }



  //direct login
  // String _directloginErrorMessage = '';
  // String get DirectloginErrorMessage => _loginErrorMessage;
  //
  // Future<ResponseModel> directLogin() async {
  //   _isLoading = true;
  //   _directloginErrorMessage = '';
  //   notifyListeners();
  //   ApiResponse apiResponse = await authRepo.directLogin();
  //   ResponseModel responseModel;
  //   if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
  //     Map map = apiResponse.response.data;
  //     String token = map["token"];
  //     authRepo.saveUserToken(token);
  //     responseModel = ResponseModel(true, 'successful');
  //   } else {
  //     String errorMessage;
  //     if (apiResponse.error is String) {
  //       errorMessage = apiResponse.error.toString();
  //     } else {
  //       errorMessage = apiResponse.error.errors[0].message;
  //     }
  //     print(errorMessage);
  //     _loginErrorMessage = errorMessage;
  //     responseModel = ResponseModel(false, errorMessage);
  //   }
  //   _isLoading = false;
  //   notifyListeners();
  //   return responseModel;
  // }

}