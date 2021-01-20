import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:institute/Values/AppColors.dart';

class InstituteVerify extends StatefulWidget {

  @override
  _InstituteVerifyState createState() => _InstituteVerifyState();
}

class _InstituteVerifyState extends State<InstituteVerify> {

  bool _isImageShown = false;
  String _error = 'Please select images in gallery';
  String _fileName;
  bool isLoading = false;
  Map<String, String> _paths;
  List<File> files = [];
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  bool _hasValidMime = false;
  FileType _pickingTypes = FileType.any;
  TextEditingController _controller = new TextEditingController();

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    setState(() => _multiPick = true);

    FilePickerResult result = await FilePicker.platform.pickFiles(
        allowMultiple: true, type: _pickingTypes);

    try {
      if (_multiPick) {
        //_paths = await FilePicker.getMultiFilePath(type: _pickingType, fileExtension: _extension);
        files = result.paths.map((path) => File(path)).toList();

      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
    });
  }



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
                                _openFileExplorer();
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
                        SizedBox(height:20,),
                        Builder(
                          builder: (BuildContext context) => _loadingPath
                              ? Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: const CircularProgressIndicator(),
                          )
                              : _fileName != null
                              ? ListTile(
                            title: const Text('Directory path'),
                            subtitle: Text(_fileName),
                          )
                              : _paths != null
                              ? Container(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            height:
                            MediaQuery.of(context).size.height * 0.50,
                            child: Scrollbar(
                                child: ListView.separated(
                                  itemCount:
                                  _paths != null && _paths.isNotEmpty
                                      ? _paths.length
                                      : 1,
                                  itemBuilder: (BuildContext context, int index) {
                                    /* final bool isMultiPath = _paths != null && _paths.isNotEmpty;
                                         String name = 'File $index: ' + (isMultiPath
                                                ? _paths
                                         .map((key, value) => key,name)
                                                // .map((e) => e.name)
                                                // .toList()[index]
                                                : _fileName ?? '...');
                                        final path = _paths
                                            .map((e) => e.path)
                                            .toList()[index]
                                            .toString();*/

                                    return ListTile(
                                      title: Text(
                                        'name',
                                      ),
                                      subtitle: Text('path'),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                  const Divider(),
                                )),
                          )
                              : const SizedBox(),
                        ),
                        SizedBox(height:20,),

                        RaisedButton.icon(
                            onPressed: (){

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
                        ),

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
                              // MyNavigator.goToKillDashBoard(context);

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
