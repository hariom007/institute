import 'package:flutter/material.dart';
import 'package:institute/Login_Register/Institute_verify/instutute_verify.dart';
import 'package:institute/MyNavigator/myNavigator.dart';
import 'package:institute/Values/AppColors.dart';

class InstituteDetails extends StatefulWidget {
  @override
  _InstituteDetailsState createState() => _InstituteDetailsState();
}

class _InstituteDetailsState extends State<InstituteDetails> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset('assets/logo/sample_logo.png',
                            height: 200,
                            width: width*0.6,),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 2,
                    shadowColor: AppColors.white_90,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: AppColors.primaryColor,
                    child: Container(
                      width: width*0.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 20,),
                          Text('Fill Institute Form',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),),
                        /*  SizedBox(height: 20,),
                          RichText(
                              text: TextSpan(
                                  children:[
                                    TextSpan(
                                      text: 'Your institute code is  ',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.black,
                                          fontFamily: 'Montserrat-regular'
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'XXXXX033XX .',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.red_90,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat-regular'
                                      ),
                                    )
                                  ]
                              )
                          ),*/
                          SizedBox(height: 20,),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5,
                                    color: AppColors.primaryColor
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Material(
                              elevation: 5,
                              color: AppColors.primaryColorLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Icon(Icons.person_outline,color: AppColors.red_90,),
                                    ),
                                    // isDense: true,
                                    labelText: 'Institute Trust Name',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Montserrat-regular',
                                      color: AppColors.red_90
                                    ),

                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5,
                                    color: AppColors.primaryColor
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Material(
                              elevation: 5,
                              color: AppColors.primaryColorLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Icon(Icons.person_outline,color: AppColors.red_90,),
                                    ),
                                    // isDense: true,
                                    labelText: 'Institute Name',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Montserrat-regular',
                                      color: AppColors.red_90
                                    ),

                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5,
                                    color: AppColors.primaryColor
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Material(
                              elevation: 5,
                              color: AppColors.primaryColorLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Icon(Icons.alternate_email,color: AppColors.red_90,),
                                    ),
                                    // isDense: true,
                                    labelText: 'Email Id',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Montserrat-regular',
                                      color: AppColors.red_90
                                    ),

                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5,
                                    color: AppColors.primaryColor
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Material(
                              elevation: 5,
                              color: AppColors.primaryColorLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Icon(Icons.phone,color: AppColors.red_90,),
                                    ),
                                    // isDense: true,
                                    labelText: 'Contact number',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat-regular',
                                        color: AppColors.red_90
                                    ),

                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5,
                                    color: AppColors.primaryColor
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Material(
                              elevation: 5,
                              color: AppColors.primaryColorLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Icon(Icons.alternate_email,color: AppColors.red_90,),
                                    ),
                                    // isDense: true,
                                    labelText: 'Website',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat-regular',
                                        color: AppColors.red_90
                                    ),

                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5,
                                    color: AppColors.primaryColor
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Material(
                              elevation: 5,
                              color: AppColors.primaryColorLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Icon(Icons.wysiwyg,color: AppColors.red_90,),
                                    ),
                                    // isDense: true,
                                    labelText: 'Campus Id',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Montserrat-regular',
                                      color: AppColors.red_90
                                    ),

                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5,
                                    color: AppColors.primaryColor
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Material(
                              elevation: 5,
                              color: AppColors.primaryColorLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Icon(Icons.wysiwyg,color: AppColors.red_90,),
                                    ),
                                    // isDense: true,
                                    labelText: 'Institute Type Id',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat-regular',
                                        color: AppColors.red_90
                                    ),

                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5,
                                    color: AppColors.primaryColor
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Material(
                              elevation: 5,
                              color: AppColors.primaryColorLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Icon(Icons.wysiwyg,color: AppColors.red_90,),
                                    ),
                                    // isDense: true,
                                    labelText: 'Board Id',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat-regular',
                                        color: AppColors.red_90
                                    ),

                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5,
                                    color: AppColors.primaryColor
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Material(
                              elevation: 5,
                              color: AppColors.primaryColorLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Icon(Icons.wysiwyg,color: AppColors.red_90,),
                                    ),
                                    // isDense: true,
                                    labelText: 'University Id',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat-regular',
                                        color: AppColors.red_90
                                    ),

                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5,
                                    color: AppColors.primaryColor
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Material(
                              elevation: 5,
                              color: AppColors.primaryColorLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Icon(Icons.location_on,color: AppColors.red_90,),
                                    ),
                                    // isDense: true,
                                    labelText: 'Institute Address',
                                    labelStyle: TextStyle(
                                      fontFamily: 'Montserrat-regular',
                                      color: AppColors.red_90
                                    ),

                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5,
                                    color: AppColors.primaryColor
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Material(
                              elevation: 5,
                              color: AppColors.primaryColorLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Icon(Icons.person,color: AppColors.red_90,),
                                    ),
                                    // isDense: true,
                                    labelText: 'Institue Short Name',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat-regular',
                                        color: AppColors.red_90
                                    ),

                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5,
                                    color: AppColors.primaryColor
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Material(
                              elevation: 5,
                              color: AppColors.primaryColorLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Icon(Icons.place_outlined,color: AppColors.red_90,),
                                    ),
                                    // isDense: true,
                                    labelText: 'Place',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat-regular',
                                        color: AppColors.red_90
                                    ),

                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5,
                                    color: AppColors.primaryColor
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Material(
                              elevation: 5,
                              color: AppColors.primaryColorLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Icon(Icons.format_list_numbered,color: AppColors.red_90,),
                                    ),
                                    // isDense: true,
                                    labelText: 'UdiseNo',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat-regular',
                                        color: AppColors.red_90
                                    ),

                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5,
                                    color: AppColors.primaryColor
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Material(
                              elevation: 5,
                              color: AppColors.primaryColorLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Icon(Icons.format_list_numbered,color: AppColors.red_90,),
                                    ),
                                    // isDense: true,
                                    labelText: 'Index No',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat-regular',
                                        color: AppColors.red_90
                                    ),

                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5,
                                    color: AppColors.primaryColor
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Material(
                              elevation: 5,
                              color: AppColors.primaryColorLight,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: TextField(
                                autofocus: false,
                                decoration: InputDecoration(
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Icon(Icons.code,color: AppColors.red_90,),
                                    ),
                                    // isDense: true,
                                    labelText: 'Center Code',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat-regular',
                                        color: AppColors.red_90
                                    ),

                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ),

                          Container(
                            width: width,
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 30,top: 5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5,
                                    color: AppColors.primaryColor
                                ),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: RaisedButton(

                              color: AppColors.appBarColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 17.0,
                              ),
                              child: Text('Submit',style: TextStyle(
                                  color: AppColors.white_00,
                                  fontSize: 15,
                                  fontFamily: 'Montserrat-SemiBold'
                              ),),
                              onPressed: () {
                                // MyNavigator.goToKillDashBoard(context);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>InstituteVerify()));

                              },
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40,)
                ],
              ),
            ),
          ),
          Positioned(
              top: 40,
              left: 0,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
                        child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
                      ),
                      Text('Back',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              )),

        ],
      ),
    );
  }
}
