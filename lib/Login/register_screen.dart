import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:suuq_somali/utils/app_theme.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final firstNameSignUpController = TextEditingController();
  final lastNameSignUpController = TextEditingController();
  final emailSignUpController = TextEditingController();
  final passSignUpController = TextEditingController();
  final ipController = TextEditingController();

  final keys = GlobalKey<FormState>();
  bool _cshowPassword = false;
  bool isLoading = false;
  bool _autoValidate = false;

  String email, password, phone, firstName, lastName;
  bool loading = true;

  handleSignUp() async {
    final form = keys.currentState;
    if (form.validate()) {
      setState(() {
        isLoading = true;
      });
      form.save();
      register();
    } else {
      setState(() {
        _autoValidate = true;

        isLoading = false;
      });
    }
  }

  /// Hanle Register

  register() async {
    final body = {
      "fname": firstNameSignUpController.text.trim(),
      "lname": lastNameSignUpController.text.trim(),
      "email": emailSignUpController.text.trim(),
      "password": passSignUpController.text.trim(),
      "ip": ipController.text.trim(),
    };

    var response = await http.post(
      Uri.parse(
        "https://suuq.cwprojects.xyz/api/user/register",
      ),
      body: body,
    );
    final jsonString = jsonEncode(body);
    var errorMsg = json.decode(response.body)['msg'];
    print(jsonString);
    if (response.statusCode == 200) {
      var data = json.decode(response.body)['status'];

      print("AAAAA$data");

      if (data == 1) {
        setState(() {
          isLoading = true;
        });
        Fluttertoast.showToast(
            msg: "Registration Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pop(context);
      } else {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(
            msg: errorMsg,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            backgroundColor: HexColor("#6fbe44"),
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
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
              child: Center(
              child: SpinKitChasingDots(
                color: Colors.red,
                size: 50.0,
              ),
            ))
          : SingleChildScrollView(
              child: Form(
                key: keys,
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Container(
                    //
                    //         alignment: Alignment.center,
                    //         height: 100,
                    //         width: 100,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(8),
                    //           color: Colors.grey,
                    //         ),
                    //         child:Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             Icon(Icons.person_add_alt_1,color: Colors.red,size: 30,),
                    //             SizedBox(height: 5,),
                    //             Center(child: Padding(
                    //               padding: const EdgeInsets.only(left:18.0),
                    //               child: Text("SignIn or Register",style: TextStyle(fontSize: 16),),
                    //             )),
                    //           ],
                    //         ) ,
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Container(
                    //         alignment: Alignment.center,
                    //         height: 100,
                    //         width: 100,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(8),
                    //
                    //           color: Colors.grey,
                    //         ),
                    //         child:Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             Icon(Icons.list_alt,color: Colors.red,size: 30,),
                    //             SizedBox(height: 5,),
                    //             Text("Create List"),
                    //           ],
                    //         ) ,
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Container(
                    //         alignment: Alignment.center,
                    //         height: 100,
                    //         width: 100,
                    //         decoration: BoxDecoration(                            borderRadius: BorderRadius.circular(8),
                    //
                    //
                    //           color: Colors.grey,
                    //         ),
                    //         child:Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           crossAxisAlignment: CrossAxisAlignment.center,
                    //           children: [
                    //             Icon(Icons.check,color: Colors.red,size: 30,),
                    //             SizedBox(height: 5,),
                    //             Text("Get Approve"),
                    //           ],
                    //         ) ,
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 28.0, top: 15),
                          child: Text(
                            "Create An Account",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 28.0, right: 28, top: 15),
                      child: Container(
                        child: TextFormField(
                          autovalidate: _autoValidate,
                          controller: firstNameSignUpController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter first name";
                            }
                            return null;
                          },
                          onChanged: (val) {},
                          decoration: InputDecoration(
                              hintText: "First Name",
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 28.0, right: 28, top: 15),
                      child: Container(
                        child: TextFormField(
                          autovalidate: _autoValidate,
                          controller: lastNameSignUpController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter last name";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Last Name",
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 28.0, right: 28, top: 15),
                      child: Container(
                        child: TextFormField(
                          autovalidate: _autoValidate,
                          controller: emailSignUpController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter email address";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Email", border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 28.0, right: 28, top: 15),
                      child: Container(
                        child: TextFormField(
                          obscureText: _cshowPassword,
                          autovalidate: _autoValidate,
                          controller: passSignUpController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter password";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _cshowPassword = !_cshowPassword;
                                  });
                                },
                                child: Icon(_cshowPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              hintText: "Password",
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 28.0, right: 28, top: 15),
                      child: Container(
                        child: TextFormField(
                          autovalidate: _autoValidate,
                          controller: ipController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter id Address";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Ip", border: OutlineInputBorder()),
                        ),
                      ),
                    ),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 28.0, right: 28, top: 25),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            height: 50,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              // ignore: deprecated_member_use
                              child: RaisedButton(
                                color: HexColor("#dc3545"),
                                onPressed: () {
                                  handleSignUp();
                                },
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("I have read and agree to the terms of service",
                              style: TextStyle(fontSize: 12)),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: InkWell(
                                onTap: () {},
                                child: Container(
                                    child: Text(
                                  " terms of service",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: HexColor("#dc3545"),
                                  ),
                                ))),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0, bottom: 20),
                      child: Container(
                        child: Row(
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(fontSize: 17),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                child: Text(
                                  " Sign in",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: HexColor("#dc3545"),
                                  ),
                                ),
                              ),
                            ),
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
