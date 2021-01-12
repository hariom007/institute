import 'package:flutter/material.dart';
import 'package:institute/Values/AppColors.dart';

class InstituteVerify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: width,
                  color: AppColors.primaryColor,
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
                SizedBox(height: 20,),
                Card(
                  elevation: 2,
                  shadowColor: AppColors.white_90,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: AppColors.white_00,
                  child: Container(
                    width: width*0.9,
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10,),
                        Text('Your Institute Details',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(height: 20,),
                        Text('Advance Group Tuition',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(height: 7,),

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
                        ),

                        SizedBox(height: 7,),

                        RichText(
                            text: TextSpan(
                                children:[
                                  TextSpan(
                                    text: 'Status :  ',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black,
                                        fontFamily: 'Montserrat-regular'
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Pending by Admin Side',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.red_90,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat-regular'
                                    ),
                                  )
                                ]
                            )
                        ),


                      ],
                    ),
                  ),
                ),
              ],
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
