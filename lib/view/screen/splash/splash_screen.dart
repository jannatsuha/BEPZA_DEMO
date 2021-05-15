import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial/localization/language_constrants.dart';
import 'package:tutorial/provider/auth_provider.dart';
import 'package:tutorial/provider/splash_provider.dart';
import 'package:tutorial/view/screen/home/home_screen.dart';

class Student {
  String name;
  int id;
  String DepartmentName;

  //Positional Constractor
  // Student(String name,String id,String dName){
  //   name=name;
  //   id=id;
  //   DepartmentName=dName;
  // }

  //Optional Constractor
  //Student({this.name = 'Shuvo', this.id = 101, this.DepartmentName = 'DUET'});

  // Positional + Optional Constractor
  Student(this.name, {this.id = 101, this.DepartmentName = 'DCC'});

  //Named Constractor
  Student.Info({this.name = 'Suha', this.id = 101, this.DepartmentName = 'DCC'});
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  StreamSubscription<ConnectivityResult> _onConnectivityChanged;

  @override
  void initState() {
    super.initState();

    bool _firstTime = true;
    _onConnectivityChanged = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (!_firstTime) {
        bool isNotConnected = result != ConnectivityResult.wifi && result != ConnectivityResult.mobile;
        isNotConnected ? SizedBox() : _globalKey.currentState.hideCurrentSnackBar();
        _globalKey.currentState.showSnackBar(SnackBar(
          backgroundColor: isNotConnected ? Colors.red : Colors.green,
          duration: Duration(seconds: isNotConnected ? 6000 : 3),
          content: Text(
            isNotConnected ? getTranslated('no_connection', _globalKey.currentContext) : getTranslated('connected', _globalKey.currentContext),
            textAlign: TextAlign.center,
          ),
        ));
        if (!isNotConnected) {
          _route();
        }
      }
      _firstTime = false;
    });

    _route();
  }

  @override
  void dispose() {
    super.dispose();

    _onConnectivityChanged.cancel();
  }

  void _route() {
    Provider.of<SplashProvider>(context, listen: false).initConfig(_globalKey).then((bool isSuccess) {
      if (isSuccess) {
        Timer(Duration(seconds: 1), () async {
          if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
           // await Provider.of<WishListProvider>(context, listen: false).initWishList(context);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
          }
        });
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("BEPZA", style:
         // Theme.of(context).textTheme.headline2
            TextStyle(fontSize: 30, fontWeight: FontWeight.w800)
          )],
        ),
      ),
    );
  }
}
