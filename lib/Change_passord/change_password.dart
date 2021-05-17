import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suuq_somali/property/PropertyPage.dart';
import 'package:suuq_somali/utils/app_theme.dart';
import 'package:suuq_somali/utils/constance.dart';
import 'package:http/http.dart' as http;

class ChangepasswordScreen extends StatefulWidget {
  @override
  _ChangepasswordScreenState createState() => _ChangepasswordScreenState();
}

class _ChangepasswordScreenState extends State<ChangepasswordScreen> {
  String token;
  String userId;

  Future<void> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString("loggedin_token");
    userId = sharedPreferences.getString("id");
    setState(() {});
  }

  String email;
  var _key = GlobalKey<FormState>();
  final cureentPassword = TextEditingController();
  final newPassword = TextEditingController();
  bool isLoading = false;

  bool _autoValidate = false;
  // snackBar Error Show Data
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  resetPassword() async {
    final form = _key.currentState;
    if (form.validate()) {
      setState(() {
        isLoading = true;
      });
      form.save();
      resetPasswordData();
    } else {
      setState(() {
        _autoValidate = true;
        isLoading = false;
      });
    }
  }

  /// Hanle Register

  resetPasswordData() async {
    final body = {
      "token": token,
      "userid": userId,
      "cur_pass": cureentPassword.text,
      "new_pass": newPassword.text,
    };

    var response = await http.post(
      Uri.parse("https://suuq.cwprojects.xyz/api/user/process-edit-pass"),
      body: body,

      // headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    final jsonString = jsonEncode(body);
    var errorMsg = json.decode(response.body)['msg'];
    print(jsonString);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      if (map['status'] == 1) {
        Fluttertoast.showToast(
            msg: "Successfully Done",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: HexColor("#6fbe44"),
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: errorMsg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: HexColor("#6fbe44"),
            textColor: Colors.white,
            fontSize: 16.0);
      }

      // print(data);
      //
      // if (data == 1) {
      //   setState(() {
      //     isLoading = true;
      //   });

      //
      //   Get.to(PropertyPage(),transition: Transition.zoom);
      // } else {
      //   setState(() {
      //     isLoading = false;
      //   });

      // }
    } else {}
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: HexColor("#dc3545"),
          elevation: 1,
        title: Text("Settings"),
        //  centerTitle: true,
          // title: Padding(
          //   padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          //   child: Image.asset(
          //     "assets/images/suuq_logo.png",
          //     height: 90,
          //     width: 170,
          //   ),
          // ),
        ),
        backgroundColor: Colors.white,
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: SingleChildScrollView(
                          child: Center(
                            child: Form(
                              key: _key,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 120,
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24, right: 24),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            AppTheme.getTheme().backgroundColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(38)),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: AppTheme.getTheme()
                                                .dividerColor,
                                            blurRadius: 8,
                                            offset: Offset(4, 4),
                                          ),
                                        ],
                                      ),

                                      // Current Password TextFields
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Container(
                                          height: 48,
                                          child: Center(
                                            child: TextFormField(
                                              controller: cureentPassword,
                                              autovalidate: _autoValidate,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return "Please enter your Current pass";
                                                }
                                                return null;
                                              },
                                              maxLines: 1,
                                              onChanged: (String txt) {},
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                              cursorColor: AppTheme.getTheme()
                                                  .primaryColor,
                                              decoration: new InputDecoration(
                                                errorText: null,
                                                border: InputBorder.none,
                                                hintText: CURRENT_PASSWORD,
                                                hintStyle: TextStyle(
                                                  color: AppTheme.getTheme()
                                                      .disabledColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),

                                  // New Password TextFields
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24, right: 24),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            AppTheme.getTheme().backgroundColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(38)),
                                        // border: Border.all(
                                        //   color: HexColor("#757575").withOpacity(0.6),
                                        // ),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: AppTheme.getTheme()
                                                .dividerColor,
                                            blurRadius: 8,
                                            offset: Offset(4, 4),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 16, right: 16),
                                        child: Container(
                                          height: 48,
                                          child: Center(
                                            child: TextFormField(
                                              controller: newPassword,
                                              autovalidate: _autoValidate,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return "Please enter your New pass";
                                                }
                                                return null;
                                              },
                                              maxLines: 1,
                                              onChanged: (String txt) {},
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                              cursorColor: AppTheme.getTheme()
                                                  .primaryColor,
                                              decoration: new InputDecoration(
                                                errorText: null,
                                                border: InputBorder.none,
                                                hintText: NEW_PASSWORD,
                                                hintStyle: TextStyle(
                                                    color: AppTheme.getTheme()
                                                        .disabledColor),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height: 16,
                                  ),
                                  // Confirm Password TextFields
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24,
                                        right: 24,
                                        bottom: 8,
                                        top: 16),
                                    child: Container(
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: HexColor("#dc3545"),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(24.0)),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: AppTheme.getTheme()
                                                .dividerColor,
                                            blurRadius: 8,
                                            offset: Offset(4, 4),
                                          ),
                                        ],
                                      ),
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(24.0)),
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            resetPassword();
                                          },
                                          child: Center(
                                            child: Text(
                                              APPLY,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget appBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            SizedBox(
              height: AppBar().preferredSize.height,
              child: Padding(
                padding: EdgeInsets.only(top: 8, left: 8),
                child: Container(
                    width: AppBar().preferredSize.height - 8,
                    height: AppBar().preferredSize.height - 8,
                    child: Material(
                      color: Colors.transparent,
                      elevation: 0,
                      child: InkWell(
                        borderRadius: BorderRadius.all(
                          Radius.circular(32.0),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 60),
              child: Center(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    CHANGE_PASSWORD,
                    style: new TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
