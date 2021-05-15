import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/data/model/response/base/api_response.dart';
import 'package:tutorial/data/model/response/zone_model.dart';
import 'package:tutorial/data/repository/zone_repo.dart';
import 'package:tutorial/view/widgets/custom_snackbar.dart';

class ZoneProvider with ChangeNotifier{
  final ZoneRepo zoneRepo;
  ZoneModel zoneModel;
  ZoneProvider({this.zoneRepo});

  List<ZoneModel>_zoneList=[];
  List<ZoneModel>get zoneList=> _zoneList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void getZoneList(BuildContext context)async{
    ApiResponse apiResponse= await zoneRepo.getZoneDetails();
    if(apiResponse.response!= null && apiResponse.response.statusCode==200){
      _zoneList.clear();
      //_zoneList.add(ZoneModel.fromJson(apiResponse.response.data));
      print("------------response----------");
      print(apiResponse.response.data);

      apiResponse.response.data.forEach((zone)=>
      _zoneList.add(ZoneModel.fromJson(zone)));

      _isLoading=false;
      notifyListeners();
    }else{
      showCustomSnackBar(apiResponse.error.toString(), context);
    }
  }
}