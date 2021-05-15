import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tutorial/data/model/response/base/api_response.dart';
import 'package:tutorial/data/model/response/employee_model.dart';
import 'package:tutorial/data/repository/employee_repo.dart';
import 'package:tutorial/view/widgets/custom_snackbar.dart';
class EmployeeProvider with ChangeNotifier{

  final EmployeeRepo employeeRepo;
  EmployeeProvider({this.employeeRepo});

  List<EmployeeModel>_employeeList=[];
  List<EmployeeModel>get employeeList=> _employeeList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void getEmployeeList(BuildContext context, String id)async{
    ApiResponse apiResponse= await employeeRepo.getEmployeeDetails(id);
    if(apiResponse.response!= null && apiResponse.response.statusCode==200){
      _employeeList.clear();
      print("------------employee response----------");
      print(apiResponse.response.data);

      apiResponse.response.data.forEach((employee)=>
          _employeeList.add(EmployeeModel.fromJson(employee)));
      _employeeList.sort((a,b)=> a.designation.sortOrder.compareTo(b.designation.sortOrder));
      _isLoading=false;
      notifyListeners();
    }else{
      showCustomSnackBar("error", context);
    }
  }
}