import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:suuq_somali/utils/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';



class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final telephoneController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
        // backgroundColor: AppTheme.getTheme().backgroundColor,
        body: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),

                      Center(child: Text("Contact Seller",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(thickness: 2,indent: 10,endIndent: 10,color: Colors.grey,),

                      SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left:28.0),
                        child: Text("Phone Number",style: TextStyle(fontSize: 18),),
                      ),

                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:28.0),
                        child: Container(
                          width: 170,
                          child: OutlineButton(
                            onPressed: (){},
                            child: Row(
                              children: [
                                Icon(Icons.phone),
                                Text("     246626266232")
                              ],
                            )
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left:24.0,top: 10),
                      //   child: Text("  Click to chat using whatsapp",style: TextStyle(fontSize: 18),),
                      // ),

                      // Padding(
                      //   padding: const EdgeInsets.only(left:28.0,top: 14),
                      //   child: InkWell(
                      //     onTap: (){},
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //           color: Colors.green,
                      //           borderRadius: BorderRadius.circular(8)
                      //       ),
                      //       alignment: Alignment.center,
                      //       height: 40,
                      //       width: 170,
                      //     child: Row(
                      //             children: [
                      //               Padding(
                      //                 padding: const EdgeInsets.only(left:18.0),
                      //                 child: Icon(Icons.phone,color: Colors.white,),
                      //               ),
                      //               Text("   WhatsApp",style: TextStyle(fontSize: 18,color: Colors.white),)
                      //             ],
                      //           )
                      //       ),
                      //   ),
                      //   ),




                      SizedBox(
                        height: 10,
                      ),


                      Padding(
                        padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 20),
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
                                  controller: nameController,
                                  keyboardType: TextInputType.name,

                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter your name';
                                    } else {
                                      return null;
                                    }
                                  },
                                  // onChanged: (String txt) {},

                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  cursorColor: AppTheme.getTheme().primaryColor,
                                  decoration: new InputDecoration(
                                    errorText: null,
                                    border: InputBorder.none,
                                    hintText: "Name",
                                    hintStyle: TextStyle(
                                        color:
                                        AppTheme.getTheme().disabledColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 16),
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
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,

                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter your email';
                                    } else {
                                      return null;
                                    }
                                  },
                                  // onChanged: (String txt) {},
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  cursorColor: AppTheme.getTheme().primaryColor,
                                  decoration: new InputDecoration(
                                    errorText: null,
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                        color:
                                        AppTheme.getTheme().disabledColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Driving License TextFields
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 16),
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
                                  controller: telephoneController,
                                  keyboardType: TextInputType.phone,

                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter telephone number';
                                    } else {
                                      return null;
                                    }
                                  },
                                  // onChanged: (String txt) {},
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  cursorColor: AppTheme.getTheme().primaryColor,
                                  decoration: new InputDecoration(
                                    errorText: null,
                                    border: InputBorder.none,
                                    hintText: "Telephone",
                                    hintStyle: TextStyle(
                                        color:
                                        AppTheme.getTheme().disabledColor),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 16),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 5,
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
                              child: TextFormField(
                                controller: messageController,
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Enter your message';
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (String txt) {},
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                                cursorColor: AppTheme.getTheme().primaryColor,
                                decoration: new InputDecoration(
                                  errorText: null,
                                  border: InputBorder.none,
                                  hintText: "Message",
                                  hintStyle: TextStyle(
                                      color: AppTheme.getTheme().disabledColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      // Submit Button Fields
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 24, right: 24, bottom: 8, top: 16),
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color:HexColor("#dc3545"),
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
                                Utils.openEmail(
                                  toEmail: emailController.text,
                                  name: nameController.text,
                                  mesaage: messageController.text,
                                  telephone: telephoneController.text,
                                );
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

                      SizedBox(
                        height: 16,
                      ),

                      // Passport TextFields

                      SizedBox(
                        height: 16,
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

// AppBar Method
}

class Utils {
  static Future openLink({
    @required String url,
  }) =>
      _launchUrl(url);

  static Future openEmail(
      {@required String toEmail,
        @required String name,
        @required String mesaage,
        @required String telephone}) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(name)}&body=${Uri.encodeFull(mesaage)}&body${Uri.encodeFull(telephone)}';

    await _launchUrl(url);
  }

  static Future _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
