import 'package:flutter/material.dart';
import 'package:institute/DashBoard/MyProfile/myProfile.dart';
import 'package:institute/Login_Register/Institute_verify/fill_institute_detail.dart';

class MyNavigator{

  static void goToKillDashBoard(BuildContext context){
    Navigator.of(context).pushNamedAndRemoveUntil('/dashboard', (route) => false);
  }

  static void goToLoginPage(BuildContext context){
    Navigator.of(context).pushNamedAndRemoveUntil('/logIn', (route) => false);
  }
  static void goToSplashScreen(BuildContext context){
    Navigator.of(context).pushNamedAndRemoveUntil('/splashScreen', (route) => false);
  }
  static void goToMYProfile(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> MyProfile()));
  }
  static void goToFillInstituteDetails(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> FillInstituteDetails()));
  }

}