import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:institute/MyNavigator/myNavigator.dart';
import 'package:institute/Values/AppColors.dart';

class InstituteVerify extends StatefulWidget {

  @override
  _InstituteVerifyState createState() => _InstituteVerifyState();
}

class _InstituteVerifyState extends State<InstituteVerify> {

  bool _isImageShown = false;
  String _error = 'Please select images in gallery';
  String _fileName;
  int serial;
  bool isLoading = false;
  Map<String, String> _paths;
  List<File> tempfiles = [];
  List<File> files = [];
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  FileType _pickingTypes = FileType.any;
  TextEditingController _controller = new TextEditingController();


  void uploadFiles() async {

    setState(() => _loadingPath = true);
    setState(() => _multiPick = true);

    FilePickerResult result = await FilePicker.platform.pickFiles(
        allowMultiple: true, type: _pickingTypes);

    try {
      if (_multiPick) {
        //_paths = await FilePicker.getMultiFilePath(type: _pickingType, fileExtension: _extension);
        tempfiles = result.paths.map((path) => File(path)).toList();
        files.addAll(tempfiles);

      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
    });
  }

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


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  SizedBox(height: 20,),
                  Card(
                    elevation: 2,
                    shadowColor: AppColors.white_90,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: AppColors.primaryColor,
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
                          SizedBox(height: 13,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Kindly proceed with ',
                              style: TextStyle(
                                fontSize: 14,
                              ),),
                              GestureDetector(
                                onTap: (){
                                 /* showDialog(
                                    context: context,
                                    builder: (_) => Material(
                                      type: MaterialType.transparency,
                                      child: Center(
                                        // Aligns the container to center
                                        child: Container(
                                          width: 100.0,
                                          height: 56.0,
                                          color: Colors.green,
                                          child: Text('jojo'),
                                        ),
                                      ),
                                    ),
                                  );*/
                                },
                                child: Text('KYC ?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: AppColors.red_00
                                ),),
                              ),
                            ],
                          ),

                          SizedBox(height:20,),
                          files.isNotEmpty ?
                          Container():
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.5,
                                    color: AppColors.white_00
                                ),
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: Material(
                              elevation: 5,
                              color: AppColors.white_00,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: TextField(
                                autofocus: false,
                                readOnly: true,
                                onTap: (){
                                  uploadFiles();
                                  print('Open File explorer');
                                },
                                decoration: InputDecoration(
                                    icon: Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Icon(Icons.upload_file,color: AppColors.black,),
                                    ),
                                    hintText: 'Upload New Document',
                                    hintStyle:  TextStyle(
                                        fontFamily: 'Montserrat-regular',
                                        color: AppColors.black
                                    ),
                                    border: InputBorder.none,

                                ),
                                style:  TextStyle(
                                    fontFamily: 'Montserrat-regular',
                                    color: AppColors.red_90
                                ),
                              ),
                            ),
                          ),

                          files.isNotEmpty ?
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Your Selected files here   ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Image.asset('assets/icon/hand-down.png',
                                  height: 20,),
                              ],
                            ),
                          ) :  Container(),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(files.length, (index) {
                              File file = files[index];
                              var sr= index+1;

                              String path =file.path;
                              String fileName = file.path.split('/').last;
                              print(fileName);

                              return Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Text(sr.toString()+".  ",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Montserrat-regular',
                                            fontWeight: FontWeight.bold
                                        ),),
                                    ),
                                    Expanded(
                                      child: ListTile(
                                        tileColor: AppColors.white_00,
                                        dense: true,
                                        title: Text(fileName,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontFamily: 'Montserrat-regular',
                                          fontWeight: FontWeight.bold
                                        ),),
                                        subtitle: Text(path,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Montserrat-regular',
                                          ),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 0,left: 5),
                                      child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            files.removeAt(index);
                                          });
                                        },
                                        child: Icon(Icons.remove_circle,color: AppColors.red_00,),
                                      )
                                    ),

                                  ],
                                ),
                              );
                            }),
                          ),

                          SizedBox(height:20,),

                          files.isNotEmpty ?
                          RaisedButton.icon(
                              onPressed: (){
                                uploadFiles();
                              },
                              color: AppColors.appButtonColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                              ),
                              icon: Icon(Icons.add,color: AppColors.white_00,),
                              label: Text('Add New File',
                              style: TextStyle(
                                fontFamily: 'Montserrat-semibold',
                                color: AppColors.white_00
                              ),)
                          )
                           : Container(),

                          SizedBox(height: 20,),
                          Container(
                            width: width,
                            child: RaisedButton(
                              color: AppColors.appBarColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 13.0,
                              ),
                              child: Text('Submit',style: TextStyle(
                                  color: AppColors.white_00,
                                  fontSize: 15,
                                  fontFamily: 'Montserrat-SemiBold'
                              ),),
                              onPressed: () {

                               if(files.isNotEmpty ){

                                MyNavigator.goToKillDashBoard(context);
                               }
                               else{
                                 showInSnackBar('Please Upload mandatory documents files.');

                               }




                              },
                            ),
                          ),

                          SizedBox(height: 10,),

                        ],
                      ),
                    ),
                  ),
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
