

import 'package:http/http.dart' as http;
import 'package:suuq_somali/models/search_model.dart';

class CarSearchService {
  Future<FilterPropertySearch> carFetchSearchData(
      String cat_id_buy,
      String city,
      String selectedArea,
      String modelYear,
      String color,
      String transmission,
      String min,
      String max,
      String milage,
      ) async {
    String url = "https://suuq.cwprojects.xyz/api/results?cat_id=$cat_id_buy";

    if (city != null) {
      url = url + "&field_27=$city";
    }
    if (selectedArea !=null) {
      url = url + "&city=$selectedArea";
    }
    if (modelYear != null) {
      url = url + "&field_40=$modelYear";
    }
    if (color != null) {
      url = url + "&field_28=$color";
    }
    if (transmission != null) {
      url = url + "&field_29=$transmission";
    }
    if (min != null) {
      url = url + "&min_price=$min";
    }
    if (max != null) {
      url = url + "&max_price=$max";
    }
    if (milage != null) {
      url = url + "&field_41=$milage";
    }

    var response = await http.get(Uri.parse(url));
    print("URL $url");
    print("Property Search Url ${response.body}");
    print("Property Search Url ${response.statusCode}");

    if (response.statusCode == 200) {
      var search = response.body;
      return filterPropertySearchFromJson(search);
    } else {
      return null;
    }
  }
}

