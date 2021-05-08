// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:VromonBuzz/utils/constants.dart';
//
// import '../../appTheme.dart';
//
// class ForgotPasswordScreen extends StatefulWidget {
//   @override
//   _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
// }
//
// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//   final TextEditingController forgotPassController = TextEditingController();
//   final _key = GlobalKey<FormState>();
//   var isLoading;
//   String message;
//   bool status;
//
//   void forgotPassword() async {
//     String url = "https://vromonbuzz.com/api/login/resetpass?appKey=VromonBuzz";
//     var body = {
//       "email": forgotPassController.text,
//     };
//     var response = await http.post(url, body: body);
//     final jsonEncodeString = json.encode(body);
//     print("$jsonEncodeString");
//     var jsonData = json.decode(response.body);
//     print("$url  ${response.body}");
//     return jsonData;
//
//     // try{
//     //
//     //   if(response.statusCode==200){
//     //     setState(() {
//     //       isLoading = true;
//     //     });
//     //     var jsonData = json.decode(response.body);
//     //     print("$url  ${response.body}");
//     //
//     //     return jsonData;
//     //
//     //
//     //   }
//     // }catch(e){
//     //     setState(() {
//     //       isLoading = false;
//     //     });
//     // }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     forgotPassword();
//     forgotPassController.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: RichText(
//             text: TextSpan(
//                 text: Vromon,
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontFamily: 'Impact',
//                   color: HexColor("#26408A"),
//                 ),
//                 children: <TextSpan>[
//                   TextSpan(
//                       text: TOUR,
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontFamily: 'Impact',
//                         color: HexColor("#118ACB"),
//                       )),
//                 ]),
//           ),
//           backgroundColor: Colors.white,
//           elevation: 1,
//           leading: IconButton(
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//               ),
//               onPressed: () {
//                 Navigator.pop(context);
//                 // Navigator.push(
//                 //     context,
//                 //     MaterialPageRoute(
//                 //         builder: (context) => ProfileScreen()));
//               }),
//         ),
//
//         // backgroundColor: AppTheme.getTheme().backgroundColor,
//         body: InkWell(
//           splashColor: Colors.transparent,
//           highlightColor: Colors.transparent,
//           focusColor: Colors.transparent,
//           onTap: () {
//             FocusScope.of(context).requestFocus(FocusNode());
//           },
//           child: Form(
//             key: _key,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: <Widget>[
//                         SizedBox(
//                           height: 150,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               left: 24, right: 24, bottom: 8, top: 16),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: AppTheme.getTheme().backgroundColor,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(38)),
//                               // border: Border.all(
//                               //   color: HexColor("#757575").withOpacity(0.6),
//                               // ),
//                               boxShadow: <BoxShadow>[
//                                 BoxShadow(
//                                   color: AppTheme.getTheme().dividerColor,
//                                   blurRadius: 8,
//                                   offset: Offset(4, 4),
//                                 ),
//                               ],
//                             ),
//                             child: Padding(
//                               padding:
//                                   const EdgeInsets.only(left: 16, right: 16),
//                               child: Container(
//                                 height: 48,
//                                 child: Center(
//                                   child: TextFormField(
//                                     validator: (value) {
//                                       if (value.isEmpty) {
//                                         return "Please enter your email";
//                                       }
//                                       return null;
//                                     },
//                                     controller: forgotPassController,
//                                     maxLines: 1,
//                                     onChanged: (String txt) {},
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                     ),
//                                     cursorColor:
//                                         AppTheme.getTheme().primaryColor,
//                                     decoration: new InputDecoration(
//                                       errorText: null,
//                                       border: InputBorder.none,
//                                       hintText: "Your Email",
//                                       hintStyle: TextStyle(
//                                           color: AppTheme.getTheme()
//                                               .disabledColor),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         // Send TextFields Button
//                         Padding(
//                           padding: const EdgeInsets.only(
//                               left: 24, right: 24, bottom: 8, top: 16),
//                           child: Container(
//                             height: 48,
//                             decoration: BoxDecoration(
//                               color: AppTheme.getTheme().primaryColor,
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(24.0)),
//                               boxShadow: <BoxShadow>[
//                                 BoxShadow(
//                                   color: AppTheme.getTheme().dividerColor,
//                                   blurRadius: 8,
//                                   offset: Offset(4, 4),
//                                 ),
//                               ],
//                             ),
//                             child: Material(
//                               color: Colors.transparent,
//                               child: InkWell(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(24.0)),
//                                 highlightColor: Colors.transparent,
//                                 onTap: () {
//                                   forgotPassword();
//                                 },
//                                 child: Center(
//                                   child: Text(
//                                     "Send",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 16,
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget appBar() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Row(
//           children: [
//             SizedBox(
//               height: AppBar().preferredSize.height,
//               child: Padding(
//                 padding: EdgeInsets.only(top: 8, left: 8),
//                 child: Container(
//                     width: AppBar().preferredSize.height - 8,
//                     height: AppBar().preferredSize.height - 8,
//                     child: Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(32.0),
//                         ),
//                         onTap: () {},
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Icon(Icons.arrow_back),
//                         ),
//                       ),
//                     )),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {},
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 8.0, left: 130),
//                 child: Center(
//                   child: Align(
//                     alignment: Alignment.centerRight,
//                     child: Text(
//                       "Forgot Password ",
//                       style: new TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.w700,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:suuq_somali/utils/app_theme.dart';



class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String email;
  var _key = GlobalKey<FormState>();
  final resetController = TextEditingController();


  /// Hanle Register


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
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _key,
          child: Column(

            children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top:58.0),
          child: Text("Forgotten Password",style: TextStyle(fontSize: 23),),
        ),

              SizedBox(height: 120,),

              Padding(
                padding: const EdgeInsets.only(
                    left: 2, right: 28, bottom: 8, top: 6),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.getTheme().backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(38)),
                    // border: Border.all(
                    //   color: HexColor("#757575").withOpacity(0.6),
                    // ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: AppTheme.getTheme().dividerColor,
                        blurRadius: 8,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Container(
                      height: 48,
                      child: Center(
                        child: TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Please enter your email";
                            }
                            return null;
                          },
                          controller: resetController,
                          maxLines: 1,
                          onChanged: (String txt) {},
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          cursorColor: AppTheme.getTheme().primaryColor,
                          decoration: new InputDecoration(
                            errorText: null,
                            border: InputBorder.none,
                            hintText: "Your Email",
                            hintStyle: TextStyle(
                                color: AppTheme.getTheme().disabledColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5,),
              Text("Enter your email address to reset your password"),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, bottom: 8, top: 16),
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.blue,

                    borderRadius:
                    BorderRadius.all(Radius.circular(24.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: AppTheme.getTheme().dividerColor,
                        blurRadius: 8,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius:
                      BorderRadius.all(Radius.circular(24.0)),
                      highlightColor: Colors.transparent,
                      onTap: () {

                      },
                      child: Center(
                        child: Text(
                          "Submit",
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
              // isLoading
              //     ? Center(
              //         child: CircularProgressIndicator(
              //           valueColor: AlwaysStoppedAnimation(Colors.indigo),
              //         ),
              //       )
              //     : RaisedButton(
              //         child: Text(
              //           "                 Send                        ",
              //           style: TextStyle(fontSize: 17, color: Colors.white),
              //         ),
              //         color: Colors.indigo[800],
              //         onPressed: () {
              //           checkForgot();
              //         },
              //       ),
            ],
          ),
        ),
      ),
    );
  }
}
