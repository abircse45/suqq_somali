import 'categories_list_model.dart';
import 'package:http/http.dart' as http;

import 'create_listing_foreach_model.dart';

class CreateListForEachServices {
  Future<CreateListForEach> fetchData() async {
    String url = "https://suuq.cwprojects.xyz/api/categories";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var categoryListing = response.body;
      return createListForEachFromJson(categoryListing);
    } else {
      return null;
    }
  }
}
