

import 'category_search_model.dart';
import 'package:http/http.dart'as http;

class CategoryAllSearchService {
  Future<CategorySearch> fetchDataChange() async {
    String url = "https://suuq.cwprojects.xyz/api/categories";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var allAds = response.body;
      return categorySearchFromJson(allAds);
    } else {
      return null;
    }
  }
}