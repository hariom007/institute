import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:institute/Login_Register/OTPScreen/otp_screen.dart';
import 'package:institute/MyNavigator/myNavigator.dart';
import 'package:institute/Values/AppColors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _state = 0;
  bool tandc = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String args) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(
            backgroundColor: AppColors.appBarColor,
            content: new Text(args,style: TextStyle(
                fontSize: 14,
                fontFamily: 'Montserrat-Semibold'
            ),)
        )
    );
  }

  Widget setUpButtonChild() {
    if (_state == 0) {
      return new Text(
        "Send OTP",
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
       Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPScreenPage()));
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
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
                                    Text('Sign Up',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(height: 30,),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: width*0.07),
                                      child: Material(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(2)
                                        ),
                                        elevation: 4.0,
                                        child: TextField(
                                          cursorColor: Colors.deepOrange,
                                          keyboardType: TextInputType.number,
                                          style: TextStyle(
                                            fontFamily: 'Montserrat-regular',
                                            letterSpacing: 2.0
                                          ),
                                          inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                                          decoration: InputDecoration(
                                              hintText: "Mobile number",
                                              hintStyle: TextStyle(
                                                fontFamily: 'Montserrat-regular',
                                                letterSpacing: 1.0
                                              ),
                                              prefixIcon: Material(
                                                elevation: 0,
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                child: Icon(
                                                  Icons.phone,
                                                  color: AppColors.green_90,
                                                ),
                                              ),
                                              border: InputBorder.none,
                                              contentPadding:
                                              EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 45,),
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          tandc = !tandc;
                                        });
                                      },
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              child: CheckboxListTile(
                                                value: tandc,
                                                checkColor: AppColors.white_00,
                                                onChanged: (val) {
                                                  if (tandc == false) {
                                                    setState(() {
                                                      tandc = true;
                                                    });
                                                  } else if (tandc == true) {
                                                    setState(() {
                                                      tandc = false;
                                                    });
                                                  }
                                                },
                                                subtitle: !tandc
                                                    ? Text(
                                                  'Accept T&C and apply.',
                                                  style: TextStyle(color: AppColors.red_80),
                                                )
                                                    : null,
                                                title:  /*Text('By Registering You Confirm That You Accept Terms & Conditions and Privacy Policy',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat-regular',
                                                      fontSize: 13
                                                  ),)*/
                                                RichText(
                                                  text: TextSpan(
                                                      style: TextStyle(
                                                          fontFamily: 'Montserrat-regular',
                                                          fontSize: 13,
                                                          color: AppColors.black
                                                      ),
                                                      children: [
                                                        TextSpan(
                                                            text: 'By Registering You Confirm That You Accept '
                                                        ),
                                                        TextSpan(
                                                          text: 'Terms & Conditions and Privacy Policy.',
                                                          style: TextStyle(
                                                              fontFamily: 'Montserrat-regular',
                                                              fontSize: 14,
                                                              color: AppColors.red_00
                                                          ),
                                                        )
                                                      ]
                                                  ),
                                                ),
                                                controlAffinity: ListTileControlAffinity.leading,
                                                activeColor: AppColors.appBarColor,
                                              )
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: width*0.07),
                                      child : new MaterialButton(
                                        child: setUpButtonChild(),
                                        onPressed: () {
                                          setState(() {
                                            if (_state == 0 && tandc == true) {
                                              animateButton();
                                            }
                                            else{
                                              showInSnackBar('Please Accept and Terms & Conditions and Privacy Policy.');
                                            }
                                          });
                                        },
                                        elevation: 4.0,
                                        minWidth: double.infinity,
                                        height: 48.0,
                                        color: AppColors.appBarColor,
                                      ),
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
                                                // MyNavigator.goToRegistrationPage(context);
                                              },
                                              child: RichText(
                                                textAlign: TextAlign.center,
                                                text: TextSpan(
                                                    text: 'Already have an account?',
                                                    style: TextStyle(
                                                        fontFamily: 'Montserrat-Regular',
                                                        color: AppColors.black
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text: ' Sign In',
                                                        style: TextStyle( color: AppColors.appButtonColor, fontSize: 18),
                                                      ),
                                                    ]),
                                              ),
                                            )
                                          ],
                                        ),
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

          ],
        )
    );
  }
}
