import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial/provider/employee_provider.dart';
import 'package:tutorial/util/dimensions.dart';
import 'package:tutorial/view/widgets/customText.dart';
import 'package:tutorial/view/widgets/custom_app_bar.dart';

class EmployeeDetails extends StatelessWidget {
  String id;
  EmployeeDetails(this.id);
  @override
  Widget build(BuildContext context) {
    Provider.of<EmployeeProvider>(context, listen: false).getEmployeeList(context,id);
    return Scaffold(
      appBar: CustomAppBar(title: "EMPLOYEE DETAILS", isBackButtonExist: true,),
      body: Consumer<EmployeeProvider>(
        builder: (context,employeeProvider,child){

          return ListView.builder(
            itemCount: employeeProvider.employeeList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(

                  padding: EdgeInsets.only(top: 10,bottom: 10,right: 20,left:12),
                  color: Color(0xFFfdf2e9 ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      CustomText(employeeProvider.employeeList[index].fullName,
                          fontSize: 18,fontWeight: FontWeight.w600,fontColor: Colors.black,),
                      Row(
                        children: [
                          CustomText("Employee Id:  ",
                            fontSize: 15,fontWeight: FontWeight.w400,fontColor: Colors.black,),
                          CustomText(employeeProvider.employeeList[index].empID,
                            fontSize: 15,fontWeight: FontWeight.w400,fontColor: Colors.black,),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText("Designation:  ",
                            fontSize: 13,fontWeight: FontWeight.w400,fontColor: Colors.black,),
                          employeeProvider.employeeList[index].designation.name.length>31?
                          Container(
                            height: 30,
                            width: 220,
                            child: CustomText(employeeProvider.employeeList[index].designation.name,
                              fontSize: 13,fontWeight: FontWeight.w400,fontColor: Colors.black,),
                          ):CustomText(employeeProvider.employeeList[index].designation.name,
                            fontSize: 13,fontWeight: FontWeight.w400,fontColor: Colors.black,),

                        ],
                      ),
                      Row(
                        children: [
                          CustomText("Employment Status:  ",
                            fontSize: 13,fontWeight: FontWeight.w400,fontColor: Colors.black,),
                          CustomText(employeeProvider.employeeList[index].employementStatus.toString(),
                            fontSize: 13,fontWeight: FontWeight.w400,fontColor: Colors.black,),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText("Zone Id:  ",
                            fontSize: 13,fontWeight: FontWeight.w400,fontColor: Colors.black,),
                          CustomText(employeeProvider.employeeList[index].zoneId.toString(),
                            fontSize: 13,fontWeight: FontWeight.w400,fontColor: Colors.black,),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText("Email:  ",
                            fontSize: 13,fontWeight: FontWeight.w400,fontColor: Colors.black,),
                          CustomText(employeeProvider.employeeList[index].email??"Not Given",
                            fontSize: 13,fontWeight: FontWeight.w400,fontColor: Colors.black,),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText("Phone:  ",
                            fontSize: 13,fontWeight: FontWeight.w400,fontColor: Colors.black,),
                          CustomText(employeeProvider.employeeList[index].phone??"Not Given",
                            fontSize: 13,fontWeight: FontWeight.w400,fontColor: Colors.black,),
                        ],
                      ),

                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

