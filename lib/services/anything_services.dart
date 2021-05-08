import 'package:http/http.dart' as http;
import 'package:suuq_somali/models/anything_model.dart';

class AnyThingService {
  Future<Anything> fetchData() async {
    String url = "https://suuq.cwprojects.xyz/api/anything";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var anything = response.body;
      return anythingFromJson(anything);
    }else{
      return null;
    }
  }
}


