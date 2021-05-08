import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suuq_somali/Profile/constant.dart';
import 'package:suuq_somali/Profile/update_profile_model.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _picker = ImagePicker();

  File fileImage;

  fileUpload() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("id");
    var token = sharedPreferences.getString("loggedin_token");
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest(
        "POST",
        Uri.parse(
            "https://suuq.cwprojects.xyz/api/user/process-upload-profile.php"));
    //add text fields
    request.fields["userid"] = id;
    request.fields["token"] = token;
    request.fields["api"] = "1";
    //create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath("profile_pic", fileImage.path);
    //add multipart to request
    request.files.add(pic);
    var response = await request.send();
    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      fileImage = File(pickedFile.path);
      fileUpload();
    });
  }

  Future<UpdateProfileModel> profileUpdate() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("id");
    var token = sharedPreferences.getString("loggedin_token");
    Map body = {
      "token": token,
      "userid": id,
    };
    var headers = {
      "Accept": "application/json",
    };
    var response = await http.post(
        Uri.parse("https://suuq.cwprojects.xyz/api/user/my-profile"),
        body: body,
        headers: headers);
    if (response.statusCode == 200) {
      UpdateProfileModel updateProfile = UpdateProfileModel.fromJson(
        json.decode(response.body),
      );
      return updateProfile;
    }
  }

  @override
  void initState() {
    super.initState();
    fileUpload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 1,
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
      body: FutureBuilder<UpdateProfileModel>(
        future: profileUpdate(),
        builder: (_, snap) {
          if (snap.hasData) {
            return Padding(
              padding: const EdgeInsets.only(left: 58.0, top: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 68.0),
                    child: Stack(
                      children: [
                        GestureDetector(

                          child: CircleAvatar(
                            radius: 60.0,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(

                              // backgroundColor: Colors.indigo,
                              radius: 57.0,
                              backgroundImage: fileImage == null
                                  ? AssetImage("assets/images/person.png")
                                  : FileImage(
                                      File(fileImage.path),
                                    ),

                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20.0,
                          right: 5.0,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: ((builder) => bottomSheet()),
                              );
                            },
                            child: Icon(
                              Icons.add_a_photo,
                              size: 31.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 29.0, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name : ${snap.data.firstName} ${snap.data.lastName}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 29.0, top: 4),
                    child: Text(
                      "Email : ${snap.data.email}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  //Spacer(),

                  SizedBox(
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 29.0, top: 4),
                    child: Text(
                      "Area : ${snap.data.profileCity ?? ""}",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          }
          return Center(
            child: SpinKitRing(
              color: Colors.red,
              size: 30,
            ),
          );
        },
      ),
    );
  }

  Widget bottomSheet() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: <Widget>[
            Text(
              ('Choose Profile Photo'),
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.camera),
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  label: Text("Camera"),
                ),
                FlatButton.icon(
                  icon: Icon(Icons.image),
                  onPressed: () {
                    Navigator.pop(context);
                    takePhoto(ImageSource.gallery);
                  },
                  label: Text("Gallery"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
