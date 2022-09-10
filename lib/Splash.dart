import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_prefrences/Student.dart';

import 'Home.dart';
import 'login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isLogin = sp.getBool('isLogin');
    String? userType = sp.getString('userType');

    if (isLogin == true) {
      if(userType == 'student'){
        Timer(Duration(seconds: 1), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => StudentScreen()));
        });
      }else{
        Timer(Duration(seconds: 1), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        });
      }

    }
    else {
      Timer(Duration(seconds: 1), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('HELLO', textScaleFactor: 3,),),
    );
  }


}
