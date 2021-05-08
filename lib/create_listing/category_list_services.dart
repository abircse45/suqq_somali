import 'categories_list_model.dart';
import 'package:http/http.dart' as http;

class CategoryListServices {
  Future<CategoryListing> fetchData() async {
    String url = "https://suuq.cwprojects.xyz/api/categories";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var categoryListing = response.body;
      return categoryListingFromJson(categoryListing);
    } else {
      return null;
    }
  }
}
