import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:institute/API/api.dart';
import 'package:institute/Helper/helper.dart';
import 'package:institute/Login_Register/Institute_verify/UploadInstituteDocuments.dart';
import 'package:institute/MyNavigator/myNavigator.dart';
import 'package:institute/Values/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FillInstituteDetails extends StatefulWidget {

  final String access_token;
  FillInstituteDetails({Key key, this.access_token}) : super(key: key);

  @override
  _FillInstituteDetailsState createState() => _FillInstituteDetailsState();
}
class Type {
  final String id;
  final String name;

  Type(this.id, this.name);
}

class _FillInstituteDetailsState extends State<FillInstituteDetails> {

  String ID;
  bool isLoading = false;
  File _image;
  String img_Data = '';
  bool _status = true;
  bool isloading = false;
  SharedPreferences sharedPreferences;

  String InstTypeId;


  TextEditingController instituteTrustNameController =  TextEditingController();
  TextEditingController instituteNameController =  TextEditingController();
  TextEditingController emailController =  TextEditingController();
  TextEditingController contactController =  TextEditingController();
  TextEditingController websiteController =  TextEditingController();
  TextEditingController addressController =  TextEditingController();
  TextEditingController shortNameController =  TextEditingController();
  TextEditingController placeController =  TextEditingController();
  TextEditingController udiseNoController =  TextEditingController();
  TextEditingController indexNoController =  TextEditingController();
  TextEditingController centerCodeController =  TextEditingController();

  Type bindCampus;
  Type bindInstituteType;
  Type bindBoardType;
  Type bindUniversity;

  List<Type> bindCampusList = <Type>[];
  List<Type> bindInstituteTypeList = <Type>[];
  List<Type> bindBoardTypeList = <Type>[];
  List<Type> bindUniversityList = <Type>[];

  getBindCampusList() async {

      var data ={

      };

    setState(() {
      isLoading = true;
    });

    try {
      var res = await CallApi().postData(data,'BindCampusList');
      var body = json.decode(res.body);
      print(body);
      if (body != null)
      {
        var result  = body as List;
        // print(result);
        var send;
        for (var abc in result) {
          send = Type(abc['ddID'],abc['ddlNm']);
          bindCampusList.add(send);
        }
      }
    }
    catch(e){
      print('print error: $e');
    }
    setState(() {
      isLoading = false;
      // isLoaded = true;

    });
  }
  getBindInstituteType() async {

    var data ={

    };

    setState(() {
      isLoading = true;
    });

    try {
      var res = await CallApi().postData(data,'BindInstituteType');
      var body = json.decode(res.body);
      // print(body);

      if (body != null)
      {
        var result  = body as List;
        // print(result);
        var send;
        for (var abc in result) {
          send = Type(abc['ddID'],abc['ddlNm']);
          bindInstituteTypeList.add(send);

          InstTypeId = abc['ddID'];
         // print("Institute Type :  ----"+ddID);
        }
      }
    }
    catch(e){
      print('print error: $e');
    }
    setState(() {
      isLoading = false;
      // isLoaded = true;

    });
  }
  getBindBoardTypeList() async {

    var data ={

    };

    setState(() {
      isLoading = true;
    });

    try {
      var res = await CallApi().postData(data,'BindBoard');
      var body = json.decode(res.body);
      print(body);
      if (body != null)
      {
        var result  = body as List;
        // print(result);
        var send;
        for (var abc in result) {
          send = Type(abc['ddID'],abc['ddlNm']);
          bindBoardTypeList.add(send);
        }
      }
    }
    catch(e){
      print('print error: $e');
    }
    setState(() {
      isLoading = false;
      // isLoaded = true;

    });
  }
  getBindUniversityList() async {

    var data ={

    };

    setState(() {
      isLoading = true;
    });

    try {
      var res = await CallApi().postData(data,'BindUniversityList');
      var body = json.decode(res.body);
      print(body);
      if (body != null)
      {
        var result  = body as List;
        // print(result);
        var send;
        for (var abc in result) {
          send = Type(abc['ddID'],abc['ddlNm']);
          bindUniversityList.add(send);
        }
      }
    }
    catch(e){
      print('print error: $e');
    }
    setState(() {
      isLoading = false;
      // isLoaded = true;

    });
  }


  @override
  void initState() {
    super.initState();

    getBindCampusList();
    getBindInstituteType();
    getBindBoardTypeList();
    getBindUniversityList();

  }

  void saveInstituteDetail(String imgData) async {
    Helper.dialogHelper.showAlertDialog(context);
    var data = {

      "InstTrustName": instituteTrustNameController.text,
      "InstName": instituteNameController.text,
      "EmailID": emailController.text,
      "ContactDetail": contactController.text,
      "WebSite": websiteController.text,
      "CampusID": bindCampus.id,
      "InstTypeID": bindInstituteType.id,
      "BoardID": bindBoardType.id,
      "UniversityID": bindUniversity.id,
      "InstAddress": addressController.text,
      "InstShortName": shortNameController.text,
      "place": placeController.text,
      "UdiseNo": udiseNoController.text,
      "IndexNo": indexNoController.text,
      "CenterCode": centerCodeController.text,
      "InstLogo" : imgData,
      "DeviceToken" : '${widget.access_token}',


    };
    print(data);
    try {
      setState(() {
        isLoading=true;
      });
      var res = await CallApi().postData(data, 'saveNewInstitute');
      var body = json.decode(res.body);
      print("Save New Institute : "+body.toString());

      if (body['ddID'] != null)
      {
        String regiInstiCode = body['ddID'];
        sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString("ICODE", regiInstiCode);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadInstituedocuments(InstTypeId : InstTypeId,regiInstiCode: regiInstiCode,)));
      }
      else
      {

        Navigator.pop(context);
        Fluttertoast.showToast(
          msg: "Error Occured",
          textColor: Colors.black,
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 15,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
        );

      }
      setState(() {
        isLoading=false;
      });

    }


    catch(e){
      print('print error: $e');
    }
  }

  void _optionDialogBox() async {
    final height = MediaQuery.of(context).size.height;
    final imageSource = await showModalBottomSheet<ImageSource>(
        context: context,
        isScrollControlled: true,
        backgroundColor: AppColors.white_00,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(2.0)),
        ),
        elevation: 2,
        builder: (builder) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                    child: Wrap(
                      children: <Widget>[
                        ListTile(
                          dense: true,
                          onTap: () => Navigator.pop(context, ImageSource.camera),
                          title: Row(children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: height * 0.02),
                            ),
                            Icon(Icons.camera_alt,color: AppColors.black,),
                            Padding(
                              padding: EdgeInsets.only(left: height * 0.02),
                            ),
                            Text('Camera',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Montserrat-regular'
                              ),),
                          ],),
                        ),
                        ListTile(
                          dense: true,
                          onTap: () => Navigator.pop(context, ImageSource.gallery),
                          title: new Row(children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: height * 0.02),
                            ),
                            Icon(Icons.sd_storage,color: AppColors.black,),
                            Padding(
                              padding: EdgeInsets.only(left: height * 0.02),
                            ),
                            Text('Gallery', style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Montserrat-regular'
                            ),),
                          ],),
                        ),
                      ],
                    ))),
          );
        }
    );
    if (imageSource != null) {
      setState(() {
        isloading = true;
      });
      final file = await ImagePicker.pickImage(source: imageSource);
      if (file != null) {
        setState(() => _image = file);
      }
      setState(() {
        isloading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: (){
                FocusScope.of(context).requestFocus(new FocusNode());
              },
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
                                  controller: instituteTrustNameController,
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
                                  controller: instituteNameController,
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
                                  controller: emailController,
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
                                  controller: contactController,
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
                                  controller: websiteController,
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
                                child: DropdownButton<Type>(
                                  isExpanded: true,
                                  // validator: (value) => value == null ? 'Select any PG type' : null,
                                  hint: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Text('Select Campus List',
                                      style: TextStyle(
                                          color: AppColors.grey_00,
                                          fontFamily: 'Montserrat-Regular'
                                      ),
                                    ),
                                  ),
                                  underline: SizedBox(),
                                  /*decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white))),*/
                                  value: bindCampus,
                                  onChanged: (Type t) {
                                    setState(() {
                                      bindCampus = t;
                                      print(t.id.toString());
                                    });
                                  },
                                  items: bindCampusList.map((Type t) {
                                    return DropdownMenuItem<Type>(
                                      value: t,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          child: Text(t.name,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat-Regular'
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
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
                                child: DropdownButton<Type>(
                                  isExpanded: true,
                                  // validator: (value) => value == null ? 'Select any PG type' : null,
                                  hint: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Text('Select Institute Type',
                                      style: TextStyle(
                                          color: AppColors.grey_00,
                                          fontFamily: 'Montserrat-Regular'
                                      ),
                                    ),
                                  ),
                                  underline: SizedBox(),
                                  /*decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white))),*/
                                  value: bindInstituteType,
                                  onChanged: (Type t) {
                                    setState(() {
                                      bindInstituteType = t;
                                      print(t.id.toString());
                                    });
                                  },
                                  items: bindInstituteTypeList.map((Type t) {
                                    return DropdownMenuItem<Type>(
                                      value: t,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          child: Text(t.name,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat-Regular'
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
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
                                child: DropdownButton<Type>(
                                  isExpanded: true,
                                  // validator: (value) => value == null ? 'Select any PG type' : null,
                                  hint: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Text('Select Board Type',
                                      style: TextStyle(
                                          color: AppColors.grey_00,
                                          fontFamily: 'Montserrat-Regular'
                                      ),
                                    ),
                                  ),
                                  underline: SizedBox(),
                                  /*decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white))),*/
                                  value: bindBoardType,
                                  onChanged: (Type t) {
                                    setState(() {
                                      bindBoardType = t;
                                      print(t.id.toString());
                                    });
                                  },
                                  items: bindBoardTypeList.map((Type t) {
                                    return DropdownMenuItem<Type>(
                                      value: t,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          child: Text(t.name,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat-Regular'
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
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
                                child: DropdownButton<Type>(
                                  isExpanded: true,
                                  // validator: (value) => value == null ? 'Select any PG type' : null,
                                  hint: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    child: Text('Select University Type',
                                      style: TextStyle(
                                          color: AppColors.grey_00,
                                          fontFamily: 'Montserrat-Regular'
                                      ),
                                    ),
                                  ),
                                  underline: SizedBox(),
                                  /*decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white))),*/
                                  value: bindUniversity,
                                  onChanged: (Type t) {
                                    setState(() {
                                      bindUniversity = t;
                                      print(t.id.toString());
                                    });
                                  },
                                  items: bindUniversityList.map((Type t) {
                                    return DropdownMenuItem<Type>(
                                      value: t,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 10),
                                          child: Text(t.name,
                                            style: TextStyle(
                                                fontFamily: 'Montserrat-Regular'
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
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
                                  controller: addressController,
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
                                  controller: shortNameController,
                                  decoration: InputDecoration(
                                      icon: Padding(
                                        padding: EdgeInsets.only(left: 7),
                                        child: Icon(Icons.person,color: AppColors.red_90,),
                                      ),
                                      // isDense: true,
                                      labelText: 'Institute Short Name',
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
                                  controller: placeController,
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
                                  controller: udiseNoController,
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
                                  controller: indexNoController,
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
                                  controller: centerCodeController,
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
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 25,right: 20,bottom: 10,top: 5),
                                child: Text('Select Institute Logo',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat-regular',
                                      color: AppColors.red_90,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                _optionDialogBox();
                              },
                              child: Container(
                                  margin: EdgeInsets.only(left: 20,right: 20,bottom: 30,top: 5),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                  ),
                                  child:  _image == null
                                      ? Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                            image: AssetImage('assets/icon/camera.png',),
                                            fit: BoxFit.contain
                                        )
                                    ),
                                  )
                                      :
                                  Container(
                                    height: 170,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        image: DecorationImage(
                                            image: FileImage(_image),
                                            fit: BoxFit.fill
                                        )
                                    ),
                                  )
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


                                  Helper.dialogHelper.showAlertDialog(context);
                                  if(_image != null){
                                    img_Data = base64Encode(_image.readAsBytesSync());
                                  }
                                  saveInstituteDetail(img_Data);

                                  Navigator.pop(context);

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
          ),
          Positioned(
              top: 40,
              left: 0,
              child: InkWell(
                onTap: () {
                  MyNavigator.goToLoginPage(context);
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
