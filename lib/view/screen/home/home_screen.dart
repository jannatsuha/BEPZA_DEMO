import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial/localization/language_constrants.dart';
import 'package:tutorial/provider/auth_provider.dart';
import 'package:tutorial/provider/zone_provider.dart';
import 'package:tutorial/view/screen/details/employee_details.dart';
import 'package:tutorial/view/widgets/customText.dart';
import 'package:tutorial/view/widgets/custom_app_bar.dart';
import 'package:tutorial/view/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ZoneProvider>(context, listen: false).getZoneList(context);
    return Scaffold(
      appBar: CustomAppBar( isBackButtonExist: false, title: 'BEPZA HOME',isHomeScreenBepza: true,),
      body: Consumer<ZoneProvider>(
        builder: (context,zoneProviderList,child){

          return ListView.builder(
            itemCount: zoneProviderList.zoneList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => EmployeeDetails
                          (zoneProviderList.zoneList[index].id.toString())));
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 10,bottom: 10,right: 20,left:12),
                    color: Color(0xFFa2d9ce).withOpacity(0.4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        zoneProviderList.zoneList[index].isHeadOffice?
                            CustomText("Head Office",fontSize: 15,fontWeight: FontWeight.w800,):
                            SizedBox.shrink(),
                        CustomText(zoneProviderList.zoneList[index].zoneName,fontSize: 18,fontWeight: FontWeight.w600),
                        CustomText(zoneProviderList.zoneList[index].zoneAddress,fontSize: 14,),
                        Row(
                          children: [
                            CustomText("Zone Code:",fontSize: 15,fontWeight: FontWeight.w500,),
                            CustomText(zoneProviderList.zoneList[index].zoneCode,fontSize: 14,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      )
    );
  }
}
