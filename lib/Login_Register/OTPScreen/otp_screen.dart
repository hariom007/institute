import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:institute/Login_Register/Institute_verify/institute_detail.dart';
import 'package:institute/MyNavigator/myNavigator.dart';
import 'package:institute/Values/AppColors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreenPage extends StatefulWidget {
  @override
  _OTPScreenPageState createState() => _OTPScreenPageState();
}

class _OTPScreenPageState extends State<OTPScreenPage> {
  int _state = 0;
  bool tandc = false;

  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Sign Up",
        style: const TextStyle(
          color: AppColors.white_00,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat-regular',
          fontSize: 16.0,
        ),
      );
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Icon(Icons.check,size: 30, color: Colors.white);
    }
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 2200), () {
      setState(() {
        _state = 2;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>InstituteDetails()));
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 400,
                      width: width,
                      color: AppColors.primaryColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            transform: Matrix4.translationValues(0, -15, 0),
                            child: /*Text('Sign In',style: GoogleFonts.galada(
                           color: AppColors.white_00,
                           fontSize: 55
                         ),)*/
                            Image.asset('assets/logo/sample_logo.png',
                              height: 200,
                              width: width*0.6,),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      color: AppColors.white_30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            transform: Matrix4.translationValues(0, height*-0.1, 0),
                            child: Card(
                              elevation: 2,
                              shadowColor: AppColors.white_90,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              color: AppColors.white_00,
                              child: Container(
                                height:400,
                                width: width*0.9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(height: 30,),
                                    Text('OTP Verification',
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold
                                      ),),
                                    SizedBox(height: 5,),
                                    Text('Enter your OTP code here',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold
                                      ),),
                                    SizedBox(height: 30,),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 60),
                                      child: PinCodeTextField(
                                        // controller: _otpController,
                                        appContext: context,
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        length:4,
                                        keyboardType: TextInputType.phone,
                                        autoDismissKeyboard: true,
                                        textStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat-SemiBold',
                                        ),
                                        backgroundColor: AppColors.white_10,
                                        autoFocus: true,
                                        enablePinAutofill: true,
                                        pinTheme: PinTheme(
                                            activeColor: AppColors.red_00,
                                            inactiveColor: AppColors.black,
                                            shape: PinCodeFieldShape.box,
                                            selectedColor: AppColors.grey_60,
                                            selectedFillColor: AppColors.grey_60,
                                            borderRadius: BorderRadius.circular(5),
                                            activeFillColor: AppColors.red_00
                                        ),
                                        animationType: AnimationType.slide,
                                        animationDuration: Duration(milliseconds: 300),
                                        // errorAnimationController: errorController, // Pass it here
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),


                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(vertical: 20),
                                        alignment: Alignment.bottomCenter,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            InkWell(
                                              onTap: () {
                                              },
                                              child: RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                    text: 'Didn\'t get the OTP ?',
                                                    style: TextStyle(
                                                        fontFamily: 'Montserrat-Regular',
                                                        color: AppColors.black
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: 'Resend OTP.',
                                                        style: TextStyle( color: AppColors.red_00, fontSize: 18),
                                                      ),
                                                    ]),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: width*0.07),
                                      child : new MaterialButton(
                                        child: setUpButtonChild(),
                                        onPressed: () {
                                          setState(() {
                                            if (_state == 0) {
                                              animateButton();
                                            }
                                          });
                                        },
                                        elevation: 4.0,
                                        minWidth: double.infinity,
                                        height: 48.0,
                                        color: AppColors.appBarColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
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
        )
    );
  }
}
