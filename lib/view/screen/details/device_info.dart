import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tutorial/view/widgets/customText.dart';
import 'package:device_info/device_info.dart';
import 'package:tutorial/view/widgets/custom_app_bar.dart';
import "package:system_info/system_info.dart";

class DeviceInfo extends StatefulWidget {
  @override
  _DeviceInfoState createState() => _DeviceInfoState();
}
const int MEGABYTE = 1024 * 1024;
class _DeviceInfoState extends State<DeviceInfo> {

  var wifiBSSID ;
  var wifiIP ;
  var wifiName ;
  String uniqueId = "Unknown";
  var androidInfo ;
  var release ;
  var sdkInt;
  var manufacturer ;
  var model ;

  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

  Future<void> initPlatformState() async {
     // try {
     //   wifiBSSID = await WifiInfo().getWifiBSSID();
     //   wifiIP = await WifiInfo().getWifiIP();
     //   wifiName = await WifiInfo().getWifiName();
     // } on PlatformException {
     //   wifiIP=null;
     // }

    if (Platform.isAndroid) {
       androidInfo = await DeviceInfoPlugin().androidInfo;
       release = androidInfo.version.release;
       sdkInt = androidInfo.version.sdkInt;
       manufacturer = androidInfo.manufacturer;
       model = androidInfo.model;
      print('Android $release (SDK $sdkInt), $manufacturer $model');
      // Android 9 (SDK 28), Xiaomi Redmi Note 7
    }

    // String platformImei;
    // String idunique;
    // // Platform messages may fail, so we use a try/catch PlatformException.
    // try {
    //   platformImei =
    //   await ImeiPlugin.getImei(shouldShowRequestPermissionRationale: false);
    //   List<String> multiImei = await ImeiPlugin.getImeiMulti();
    //   print(multiImei);
    //   idunique = await ImeiPlugin.getId();
    // } on PlatformException {
    //   platformImei = 'Failed to get platform version.';
    // }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      // _platformImei = platformImei;
      // uniqueId = idunique;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Kernel architecture     : ${SysInfo.kernelArchitecture}");
    print("Kernel bitness          : ${SysInfo.kernelBitness}");
    print("Kernel name             : ${SysInfo.kernelName}");
    print("Kernel version          : ${SysInfo.kernelVersion}");
    print("Operating system name   : ${SysInfo.operatingSystemName}");
    print("Operating system version: ${SysInfo.operatingSystemVersion}");
    print("User directory          : ${SysInfo.userDirectory}");
    print("User id                 : ${SysInfo.userId}");
    print("User name               : ${SysInfo.userName}");
    print("User space bit      : ${SysInfo.userSpaceBitness}");
    var processors = SysInfo.processors;
    print("Number of processors    : ${processors.length}");
    for (var processor in processors) {
      print("  Architecture          : ${processor.architecture}");
      print("  Name                  : ${processor.name}");
      print("  Socket                : ${processor.socket}");
      print("  Vendor                : ${processor.vendor}");
    }
    print("Total physical memory   : ${SysInfo.getTotalPhysicalMemory() ~/ MEGABYTE} MB");
    print("Free physical memory    : ${SysInfo.getFreePhysicalMemory() ~/ MEGABYTE} MB");
    print("Total virtual memory    : ${SysInfo.getTotalVirtualMemory() ~/ MEGABYTE} MB");
    print("Free virtual memory     : ${SysInfo.getFreeVirtualMemory() ~/ MEGABYTE} MB");
    print("Virtual memory size     : ${SysInfo.getVirtualMemorySize() ~/ MEGABYTE} MB");

 Row CustomRow (String s1, var s2){
   return Row(
     children: [
       Icon(Icons.check_circle,size: 15,color: Colors.teal,),
       SizedBox(width: 5,),
       CustomText(s1+" :  ",fontSize: 18,),
       s2.toString().length<30?
       CustomText(s2.toString(),fontSize: 14,fontWeight: FontWeight.w600,):
       Container(
         height: 35,
           width: 180,
           child: CustomText(s2.toString(),fontSize: 14,fontWeight: FontWeight.w600,))
     ],
   );
 }

    return Scaffold(
      appBar:CustomAppBar(title: "DEVICE INFO",isBackButtonExist: true,),

      body:  Container(
        padding: EdgeInsets.only(left: 20,right: 8,top: 10,bottom: 10),
        color: Color(0xFFf9ebea ),
        child: Column(

          children: [
            CustomRow("Android relese", release),
            SizedBox(height: 15,),
            CustomRow("Sdk", sdkInt.toString()),
            SizedBox(height: 15,),
            CustomRow("Manufacturer", manufacturer),
            SizedBox(height: 15,),
            CustomRow("Phone model", model),
            SizedBox(height: 15,),
            CustomRow("Kernel name", SysInfo.kernelName),
            SizedBox(height: 15,),
            CustomRow("Space bit", SysInfo.userSpaceBitness),
            SizedBox(height: 15,),
            CustomRow("Processors", processors.length),
            SizedBox(height: 15,),
            CustomRow("Total physical memory", (SysInfo.getTotalPhysicalMemory() ~/ MEGABYTE).toString()+" MB"),
            SizedBox(height: 15,),
            CustomRow("Free physical memory", (SysInfo.getFreePhysicalMemory() ~/ MEGABYTE).toString()+" MB"),
            SizedBox(height: 15,),
            CustomRow("Total Virtual memory", (SysInfo.getTotalVirtualMemory() ~/ MEGABYTE).toString()+" MB"),
            SizedBox(height: 15,),
            CustomRow("Free Virtual memory", (SysInfo.getFreeVirtualMemory() ~/ MEGABYTE).toString()+" MB"),

            // Row(
            //   children: [
            //     CustomText("IP address : ",fontSize: 15,),
            //     CustomText(wifiIP.toString()??"No wifi connected",fontSize: 10,),
            //   ],
            // ),
          ],
        ),
      )
    );
  }
}
