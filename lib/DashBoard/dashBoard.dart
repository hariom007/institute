import 'package:flutter/material.dart';
import 'package:institute/DashBoard/HomePage/homePage.dart';
import 'package:institute/DashBoard/MyProfile/myProfile.dart';
import 'package:institute/Values/AppColors.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  bool showBadge = false;

  int _currentIndex = 0;
  int _pState = 0;


  @override
  Widget build(BuildContext context) {
  var pages = [new  HomePage(), new  MyProfile(),];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: pages[_currentIndex],
          bottomNavigationBar: new BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            backgroundColor: AppColors.primaryColor,
            selectedItemColor: AppColors.primaryColorDark,
            unselectedItemColor: AppColors.appButtonColor,
            onTap: onTappedChanged,
            items: [
              BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                title: new Text("DashBoard"),
              ),
              BottomNavigationBarItem(
                icon: new Icon(Icons.person),
                title: new Text("My Profile"),
              )
            ],
          )
      ),
    );
  }
  void onTappedChanged(int index) {
    setState(() {
      _currentIndex = index;
      _pState=_currentIndex;
    });
  }
}
