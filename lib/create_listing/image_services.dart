import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageService {
  static Future<dynamic> uploadFile(filePath) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = sharedPreferences.getString("id");
    var token = sharedPreferences.getString("loggedin_token");

    try {
      FormData formData = FormData.fromMap(
        {
          "image": await MultipartFile.fromFile(filePath, filename: "main_pic"),
          "token" : token,
          "userid": id,
        },
      );

      Response response = await Dio()
          .post("https://suuq.cwprojects.xyz/user/process-upload-main-pic.php",
              data: formData,
              options: Options(
                headers: <String, String>{
                  "Accept": "application/json",
                },
              ));
      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {}
  }
}
