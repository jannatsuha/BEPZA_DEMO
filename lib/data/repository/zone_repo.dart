import 'package:tutorial/data/datasource/remote/dio/dio_client.dart';
import 'package:tutorial/data/datasource/remote/exception/api_error_handler.dart';
import 'package:tutorial/data/model/response/base/api_response.dart';
import 'package:tutorial/util/app_constant.dart';

class ZoneRepo{
   final DioClient dioClient;
   ZoneRepo({this.dioClient});
   
   Future<ApiResponse>getZoneDetails() async{
     try{
       final response=
       await dioClient.get(AppConstant.ZONE_URI);
       return ApiResponse.withSuccess(response);
     }catch(e){
       return ApiResponse.withError
         (ApiErrorHandler.getMessage(e));
     }
   }
}