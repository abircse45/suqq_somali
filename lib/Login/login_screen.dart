import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suuq_somali/Forgot_password/fogot_password.dart';
import 'package:suuq_somali/Login/register_screen.dart';
import 'package:suuq_somali/models/login_request_model.dart';
import 'package:suuq_somali/models/login_user.dart';
import 'package:suuq_somali/screen/tabbar_page.dart';
import 'package:suuq_somali/utils/app_theme.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();

}
class LoginResData {
  int type;
  LoginUser loginResponse;

  LoginResData(this.type, this.loginResponse);
}

class _LoginScreenState extends State<LoginScreen> {


  LoginUser loginResponse;

  final emailController = TextEditingController();
  final passcontroller = TextEditingController();
  bool isLoading = false;
  bool _showPassword = false;
  final _key = GlobalKey<FormState>();
  String email, password;
  LoginRequestModel loginRequestModel;
  bool status;
  String errorMessage;


  //bool isLoading = false;
  bool isSuccess;

  //<---------------------------Save Token
  Future saveToken(value) async {
    // Async func to handle Futures easier; or use Future.then
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('loggedin_token', value);
    return prefs.setString("loggedin_token", value);
  }

  Future<LoginResData> login(LoginRequestModel requestModel) async {
    LoginResData loginResData;
    String url = "https://suuq.cwprojects.xyz/api/user/sign-in";
    try {
      setState(() {
        isLoading = true;
      });
      final response = await http.post(
        Uri.parse(url),
        body: requestModel.toJson(),
      );

      print('API ${response.statusCode}\n API${json.decode(response.body)}');

      // return LoginResponseModel.fromJson();
      loginResponse = LoginUser.fromJson(json.decode(response.body));
      print('bghbhdjsfbhsj ${loginResponse.status}');
      errorMessage = json.decode(response.body)['msg'];
      print('Status ${loginResponse.status}');
      print('error mesage  $errorMessage');

      if (loginResponse.status == 1) {
        loginResData = LoginResData(1, loginResponse);
      } else {
        print("Error = $errorMessage");

        loginResData = LoginResData(0, loginResponse);
      }


    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
    return loginResData;
  }

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


  bool _autoValidate = false;

  @override
  void initState() {
    super.initState();
    emailController.clear();
    passcontroller.clear();
    loginRequestModel = LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0.0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Image.asset(
            "assets/images/suuq_logo.png",
            height: 90,
            width: 170,
          ),
        ),
      ),
      body: isLoading
          ? Center(
        child: Center(child: SpinKitChasingDots(
          color: Colors.red,
          size: 50.0,
        ),),
      )
          : SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, top: 15),
                    child: Text(
                      "Sign In",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 28, top: 15),
                child: Container(
                  child: TextFormField(
                  //  autovalidate: true,
                    controller: emailController,
                    keyboardType:
                    TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter your email';
                      }

                      return null;
                    },
                    onChanged: (numVal) {
                      loginRequestModel.email =
                          numVal;
                      setState(() {
                        email = numVal.trim();
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Email", border: OutlineInputBorder()),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 28, top: 15),
                child: Container(
                  child: TextFormField(
                    //   autovalidate: true,
                    controller: passcontroller,
                    onChanged: (numVal) {
                      loginRequestModel.password =
                          numVal;

                      setState(() {
                        password = numVal.trim();
                      });
                    },
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty) {
                        return ('Enter your valid password');
                      }
                      return null;
                    },
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          child: Icon(_showPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        hintText: "Password",
                        border: OutlineInputBorder()),
                  ),
                ),
              ),

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 28.0, right: 28, top: 25),
                  child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      height: 50,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          color: HexColor("#dc3545"),
                          onPressed: () {
                            setState(() {
                              if (_key.currentState
                                  .validate()) {
                                login(loginRequestModel)
                                    .then((value) async {
                                  if (value != null) {
                                    if (value.type == 1) {
                                      saveToken(value
                                          .loginResponse.user.loggedinToken);
                                      SharedPreferences
                                      sharedPref =
                                      await SharedPreferences
                                          .getInstance();
                                      sharedPref.setString(
                                          'email',
                                          value
                                              .loginResponse
                                              .user.email
                                              );
                                      sharedPref.setString(
                                          'first_name',
                                          value
                                              .loginResponse
                                              .user
                                              .firstName);
                                      sharedPref.setString(
                                          'last_name',
                                          value
                                              .loginResponse
                                              .user
                                              .lastName);
                                      sharedPref.setString(
                                          'status',
                                          value
                                              .loginResponse.status.toString());
                                      sharedPref.setString(
                                          'id',
                                          value.loginResponse
                                              .user.id);
                                      //
                                      // sharedPref.setString(
                                      //     'photo',
                                      //     value
                                      //         .loginResponse
                                      //         .profileInfo.photo
                                      // );
                                      sharedPref.setString(
                                          'token',
                                          value.loginResponse
                                              .user.loggedinToken);
                                      setState(() {
                                        isLoading = false;
                                      });
                                      Fluttertoast.showToast(
                                          msg:
                                          ('Login Successfully'),
                                          toastLength: Toast
                                              .LENGTH_SHORT,
                                          gravity: ToastGravity
                                              .BOTTOM,
                                          timeInSecForIosWeb: 2,
                                          backgroundColor:
                                          HexColor("#dc3545"),
                                          textColor:
                                          Colors.white,
                                          fontSize: 16.0);

                                  Get.to(TabBarScreen(),transition: Transition.zoom);
                                      //   Navigator.of(context).pop();


                                    } else {
                                      Fluttertoast.showToast(
                                          msg: errorMessage,
                                          toastLength: Toast
                                              .LENGTH_SHORT,
                                          gravity: ToastGravity
                                              .BOTTOM,
                                          timeInSecForIosWeb: 4,
                                          backgroundColor:
                                          HexColor("#dc3545"),
                                          textColor:
                                          Colors.white,
                                          fontSize: 20.0);
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  } else {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Fluttertoast.showToast(
                                        msg:
                                        "Something went wrong!",
                                        toastLength:
                                        Toast.LENGTH_SHORT,
                                        gravity:
                                        ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 4,
                                        backgroundColor:
                                        HexColor("#dc3545"),
                                        textColor: Colors.white,
                                        fontSize: 20.0);
                                  }
                                  Navigator.of(context);

                                  setState(() {});
                                });
                              } else {
                                setState(() {
                                  _autoValidate = true;
                                });
                              }
                            });
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: InkWell(
                          onTap: () {
                            Get.to(ForgotPasswordScreen(),
                                transition: Transition.zoom);
                          },
                          child: Container(
                              child: Text(
                            "Forgot password?",
                            style: TextStyle(fontSize: 17),
                          ))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Container(
                  child: Row(
                    children: [
                      Text(
                        "Need an account?",
                        style: TextStyle(fontSize: 17),
                      ),
                      InkWell(
                          onTap: () {
                            Get.to(RegisterScreen(),
                                transition: Transition.zoom);
                          },
                          child: Container(
                              child: Text(
                            " Register",
                            style: TextStyle(fontSize: 17, color: HexColor("#dc3545"),),
                          ))),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
