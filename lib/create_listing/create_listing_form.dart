import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suuq_somali/controller/property_controller.dart';
import 'package:suuq_somali/create_listing/create_listing_item_tile.dart';
import 'package:suuq_somali/utils/app_theme.dart';
import 'package:http/http.dart' as http;
import 'createList_controller_foreach.dart';

class CreateListFormPage extends StatefulWidget {
  @override
  _CreateListFormPageState createState() => _CreateListFormPageState();
}

class _CreateListFormPageState extends State<CreateListFormPage> {
  final crateListFormSearch = Get.put(CreateListForEachController());
  final PropertyController propertyCategory = Get.put(PropertyController());
  var multiData;
  bool isLoading = false;
  String selectedCity;
  String selectedArea;
  String selectedRoom;
  String bathrooms;
  String selectedCarSpace;
  String buildYearValue;
  List<Asset> images = <Asset>[];
  final _key = GlobalKey<FormState>();
  bool _autovalidate = false;
  Dio _dio = Dio();
  //var multipleData;
  Widget buildGridView() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, top: 8, right: 10.0),
      child: GridView.count(
        shrinkWrap: true,
        primary: false,
        crossAxisCount: 3,
        crossAxisSpacing: 7,
        children: List.generate(images.length, (index) {
          Asset asset = images[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AssetThumb(
              asset: asset,
              width: 220,
              height: 220,
            ),
          );
        }),
      ),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "icon"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {}

    if (!mounted) return;

    setState(() {
      images = resultList;
      _saveImages();
    });
  }

  _saveImages() async {
    if (images != null) {
      for (int i = 0; i < images.length; i++) {
        ByteData byteData = await images[i].getByteData();
        List<int> imageData = byteData.buffer.asUint8List();
        dio.MultipartFile multipartFile = dio.MultipartFile.fromBytes(
          imageData,
          filename: images[i].name,
          contentType: MediaType("item_img", "jpg"),
        );
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        var id = sharedPreferences.getString("id");
        var token = sharedPreferences.getString("loggedin_token");
        dio.FormData formData = dio.FormData.fromMap({
          "item_img": multipartFile,
          "userid": id,
          "token": token,
          "submit_token": randomNumeric(4),
        });
        var response = await _dio.post(
            "https://suuq.cwprojects.xyz/user/process-upload.php",
            data: formData);
        if (response.statusCode == 200) {
          multiData = response.data;
          print("Response Dio    ..>>  ${response.data}");
        } else {}
      }
    }
  }

  final itemTilte = TextEditingController();
  final price = TextEditingController();
  final shortDescription = TextEditingController();
  final description = TextEditingController();
  final address = TextEditingController();
  final postalCode = TextEditingController();
  final phoneNumber = TextEditingController();
  final enterHouseSizeController = TextEditingController();
  bool _isLoading = false;

  final keys = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      singleFileImage = File(pickedFile.path);
      singlePhotoUpload();
    });
  }

  File singleFileImage;
  String name;
  Future<void> singlePhotoUpload() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("id");
    var token = sharedPreferences.getString("loggedin_token");
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("https://suuq.cwprojects.xyz/user/process-upload-main-pic.php"),
    );
    //add text fields
    request.fields["id"] = id;
    request.fields["token"] = token;
    request.fields["api"] = "1";
    //create multipart using filepath, string or bytes
    var pic =
        await http.MultipartFile.fromPath("main_pic", singleFileImage.path);
    //add multipart to request
    request.files.add(pic);
    var response = await request.send();
    //Get the response from the server
    var responseData = await response.stream.toBytes();

    var responseString = String.fromCharCodes(responseData);
    Map<String, dynamic> map = jsonDecode(responseString);
    name = map['filename'];
    print("FileName.....>>> $name");

    //  fileName = _singleUploadPhotoModel.filename;
    print("Response ...$responseString");

    // import 'dart:convert';
    // if (map["status"] == 1) {
    //     final String title = itemTilte.text;
    //     final String priceData = price.text;
    //     final String shortDesciption = shortDescription.text;
    //     final String desciption = description.text;
    //     final String addressData = address.text;
    //     final String postal_code = postalCode.text;
    //     final String phone = phoneNumber.text;
    //     final String houseSize = enterHouseSizeController.text;
    //
    //     postAddData(
    //       title,
    //       priceData,
    //       shortDesciption,
    //       desciption,
    //       addressData,
    //       postal_code,
    //       phone,
    //       houseSize,
    //     );
    //   }

    //  print("File Name....>> $fileName");
  }

  Future<void> postAddData(
    String listingTitle,
    String price,
    String shortDescription,
    String description,
    String address,
    String postalCode,
    String phonenumber,
    String houseSize,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("id");
    var token = sharedPreferences.getString("loggedin_token");
    var headers = {
      'Cookie': 'loggedin=5-localhost-b8f58f8ac5f5a59be82f438fa5af424a'
    };
    String url = "https://suuq.cwprojects.xyz/api/user/process-create-listing";
    var body = {
      "token": token,
      "userid": id,
      "listing_title": listingTitle,
      "price": price,
      "short_desc": shortDescription,
      "description": description,
      "address": address,
      "postal_code": postalCode,
      "phone": phonenumber,
      "uploaded_main_pic": name,
      "uploads[]": multiData,
      "area_code": "1",
      "category_id": "173",
      "city_id": "1",
      "country_code": "su",
      "custom_fields_ids": "32",
      "latlng": "23.4545,4.5634",
      "wa_area_code": "",
      "wa_area_code": "",
      "cats[]": ""
    };
    var response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      if (map['status'] == 1) {
        checkInOutDialogBox(
            context, "Success".toUpperCase(), "Successfully Data inserted!");
      } else {
        errorDialouge(context, "Error".toUpperCase(), "Something Went Wrong!");
      }

      // if (data == 1) {
      //   // Fluttertoast.showToast(
      //   //     msg: "Data insert Successfully",
      //   //     toastLength: Toast.LENGTH_SHORT,
      //   //     gravity: ToastGravity.BOTTOM,
      //   //     timeInSecForIosWeb: 4,
      //   //     backgroundColor: Colors.red,
      //   //     textColor: Colors.white,
      //   //     fontSize: 16.0);
      // } else {
      //   // Fluttertoast.showToast(
      //   //     msg: "Something Went Wrong..",
      //   //     toastLength: Toast.LENGTH_SHORT,
      //   //     gravity: ToastGravity.BOTTOM,
      //   //     timeInSecForIosWeb: 4,
      //   //     backgroundColor: Colors.red,
      //   //     textColor: Colors.white,
      //   //     fontSize: 16.0);
      // }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Post Your Ad"),
        backgroundColor: HexColor("#dc3545"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0, left: 10, right: 10),
        child: GestureDetector(
          onTap: () {
            //   singlePhotoUpload();

            // if(name !=null){
            //
            //
            // }else{
            //   Fluttertoast.showToast(
            //       msg: "Please upload image",
            //       toastLength: Toast.LENGTH_SHORT,
            //       gravity: ToastGravity.BOTTOM,
            //       timeInSecForIosWeb: 4,
            //       backgroundColor: Colors.red,
            //       textColor: Colors.white,
            //       fontSize: 16.0);
            // }

            //    })
//;





            if (_key.currentState.validate()) {
              if (name==null) {
                return Fluttertoast.showToast(
                    msg: "Please Select Main Photo",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 4,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else {
                singlePhotoUpload();
              }
              if (images.isEmpty) {
                return Fluttertoast.showToast(
                    msg: "Please Select Multiple Photo",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 4,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else {
                _saveImages();
              }
              final String title = itemTilte.text;
              final String priceData = price.text;
              final String shortDesciption = shortDescription.text;
              final String desciption = description.text;
              final String addressData = address.text;
              final String postal_code = postalCode.text;
              final String phone = phoneNumber.text;
              final String houseSize = enterHouseSizeController.text;
              postAddData(
                title,
                priceData,
                shortDesciption,
                desciption,
                addressData,
                postal_code,
                phone,
                houseSize,
              );
            } else {
              setState(() {
                _autovalidate = true;
              });
            }

            //
            //  if (_key.currentState.validate()) {
            //
            //
            //
            //  //   final String title = itemTilte.text;
            //  //   final String priceData = price.text;
            //  //   final String shortDesciption = shortDescription.text;
            //  //   final String desciption = description.text;
            //  //   final String addressData = address.text;
            //  //   final String postal_code = postalCode.text;
            //  //   final String phone = phoneNumber.text;
            //  //   final String houseSize = enterHouseSizeController.text;
            //  //
            //  //   postAddData(
            //  //     title,
            //  //     priceData,
            //  //     shortDesciption,
            //  //     desciption,
            //  //     addressData,
            //  //     postal_code,
            //  //     phone,
            //  //     houseSize,
            //  //   );
            //  //
            //  // } else {
            //  //   setState(() {
            //  //     _autovalidate = true;
            //  //   });
            //   }
            // // setState(() {});
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15.0),
            ),
            height: 45,
            width: 250,
            child: Text(
              "Submit",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidate: _autovalidate,
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Item Title..........

              Padding(
                padding: const EdgeInsets.only(
                    left: 25.0, right: 18, bottom: 19, top: 20),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please enter house item title";
                    }
                    return null;
                  },
                  controller: itemTilte,
                  decoration: InputDecoration(hintText: "Item Title"),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 18, bottom: 19),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please enter price";
                    }
                    return null;
                  },
                  controller: price,
                  decoration: InputDecoration(hintText: "Price"),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              singleFileImage == null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, bottom: 10),
                          child: Text(
                            "No Image",
                            style: TextStyle(fontSize: 19),
                          ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 100,
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                File(singleFileImage.path),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

              SizedBox(
                height: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, left: 20),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: ((builder) => bottomSheet()),
                      );
                    },
                    child: Container(
                      height: 40,
                      width: 180,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Text(
                        "Upload Main photo",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
//Multiple Photo....................

              SizedBox(
                height: 15,
              ),

              Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 18, bottom: 19),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please enter short_des";
                    }
                    return null;
                  },
                  controller: shortDescription,
                  decoration: InputDecoration(hintText: "Short Description"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 18, bottom: 19),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please enter description";
                    }
                    return null;
                  },
                  controller: description,
                  decoration: InputDecoration(hintText: "Description"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 18, bottom: 19),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please enter address";
                    }
                    return null;
                  },
                  controller: address,
                  decoration: InputDecoration(hintText: "Address"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 18, bottom: 19),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please enter postal code";
                    }
                    return null;
                  },
                  controller: postalCode,
                  decoration: InputDecoration(hintText: "Postal Code"),
                ),
              ),
              Obx(() {
                if (propertyCategory.loading.value) {
                  return Center(
                    child: SpinKitChasingDots(
                      color: Colors.red,
                      size: 20,
                    ),
                  );
                }
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 23.0, top: 18),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(color: Colors.white),
                    child: SearchableDropdown(
                      hint: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Text("Location"),
                      ),
                      iconSize: 20,
                      displayClearIcon: true,
                      items: propertyCategory.getProperty.value.states.values
                          .map((e) {
                        return DropdownMenuItem(
                          child: Text(e.stateName),
                          value: e.stateName,
                        );
                      }).toList(),
                      value: selectedCity,
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value;
                        });
                      },
                      isExpanded: true,
                    ),
                  ),
                );
              }),
              SizedBox(
                height: 10,
              ),
              Obx(
                () {
                  if (propertyCategory.loading.value) {
                    return Center(
                      child: SpinKitChasingDots(
                        color: Colors.red,
                        size: 40,
                      ),
                    );
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 15, right: 23),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(color: Colors.white),
                      child: DropdownButton(
                        iconSize: 30,
                        isExpanded: true,
                        style: TextStyle(color: Colors.black),
                        hint: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            " Select Area",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        items: propertyCategory.getProperty.value.cities.values
                            .map((e) {
                          return DropdownMenuItem(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Container(
                                child: ListTile(
                                  title: Text(e.cityName),
                                ),
                              ),
                            ),
                            value: e.cityName,
                          );
                        }).toList(),
                        value: selectedArea,
                        onChanged: (text) {
                          setState(() {
                            selectedArea = text;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 18, bottom: 19),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please enter phone number";
                    }
                    return null;
                  },
                  controller: phoneNumber,
                  decoration: InputDecoration(hintText: "Phone Number"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 18, bottom: 19),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please enter whats app no";
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: "Whats App Number"),
                ),
              ),
              Obx(
                () {
                  if (crateListFormSearch.cl.value) {
                    return Center(
                      child: SpinKitChasingDots(
                        color: Colors.red,
                        size: 50.0,
                      ),
                    );
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 25, right: 25),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        style: TextStyle(color: Colors.black),
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Rooms",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        items: crateListFormSearch.roomList.map((element) {
                          return DropdownMenuItem(
                            value: element,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 13.0),
                              child: Text(
                                // ignore: unnecessary_brace_in_string_interps
                                "${element} Rooms",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          );
                        }).toList(),
                        value: selectedRoom,
                        onChanged: (text) {
                          setState(() {
                            selectedRoom = text;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () {
                  if (crateListFormSearch.cl.value) {
                    return Center(
                      child: SpinKitChasingDots(
                        color: Colors.red,
                        size: 50.0,
                      ),
                    );
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 25, right: 25),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        style: TextStyle(color: Colors.black),
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Bathrooms",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        items: crateListFormSearch.bathRooms.map((element) {
                          return DropdownMenuItem(
                            value: element,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 13.0),
                              child: Text(
                                // ignore: unnecessary_brace_in_string_interps
                                "${element} Bathrooms",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          );
                        }).toList(),
                        value: bathrooms,
                        onChanged: (text) {
                          setState(() {
                            bathrooms = text;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),

              SizedBox(
                height: 10,
              ),
              Obx(
                () {
                  if (crateListFormSearch.cl.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 25, right: 25),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        style: TextStyle(color: Colors.black),
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Car Space",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        items: crateListFormSearch.carSpace.map((element) {
                          return DropdownMenuItem(
                            value: element,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 13.0),
                              child: Text(
                                // ignore: unnecessary_brace_in_string_interps
                                "${element} Car Space",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          );
                        }).toList(),
                        value: selectedCarSpace,
                        onChanged: (text) {
                          setState(() {
                            selectedCarSpace = text;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 25.0, right: 18, bottom: 19),
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please enter house size";
                    }
                    return null;
                  },
                  controller: enterHouseSizeController,
                  decoration: InputDecoration(hintText: "Enter house Size"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                () {
                  if (crateListFormSearch.cl.value) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 25, right: 25),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        style: TextStyle(color: Colors.black),
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Build Year",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        items: crateListFormSearch.buildYear.map((element) {
                          return DropdownMenuItem(
                            value: element,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 13.0),
                              child: Text(
                                // ignore: unnecessary_brace_in_string_interps
                                "${element}",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          );
                        }).toList(),
                        value: buildYearValue,
                        onChanged: (text) {
                          setState(() {
                            buildYearValue = text;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              //   Multiple Image Upload............
              images.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 15, bottom: 15),
                      child: Text(
                        "Photos",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: buildGridView(),
                    ),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 15),
                child: Container(
                  height: 35,
                  width: 100,
                  child: RaisedButton(
                    color: Colors.red,
                    onPressed: loadAssets,
                    child: Text(
                      "Browse",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkInOutDialogBox(
      BuildContext context, String title, String description) {
    AwesomeDialog(
        dismissOnBackKeyPress: false,
        context: context,
        animType: AnimType.TOPSLIDE,
        headerAnimationLoop: false,
        dialogType: DialogType.SUCCES,
        title: title,
        dialogBackgroundColor: Colors.white,
        desc: description,
        btnOkOnPress: () {
          Get.to(CreateListingItem());

          // Get.to(() => PinCodeVerificationScreen(title));
        },
        btnOkIcon: Icons.check_circle,
        onDissmissCallback: () {
          debugPrint('Dialog Dissmiss from callback');
        })
      ..show();
  }

  void errorDialouge(BuildContext context, String title, String description) {
    AwesomeDialog(
        context: context,
        animType: AnimType.TOPSLIDE,
        headerAnimationLoop: false,
        dialogType: DialogType.ERROR,
        title: title,
        dialogBackgroundColor: Colors.white,
        desc: description,
        btnOkOnPress: () {
          Get.back();

          // Get.to(() => PinCodeVerificationScreen(title));
        },
        btnOkIcon: Icons.error_outlined,
        onDissmissCallback: () {
          debugPrint('Dialog Dissmiss from callback');
        })
      ..show();
  }

  Widget bottomSheet() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        height: 150.0,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: <Widget>[
            Text(
              ('Upload Main Photo'),
              style: TextStyle(
                fontSize: 23.0,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    singlePhotoUpload();
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
