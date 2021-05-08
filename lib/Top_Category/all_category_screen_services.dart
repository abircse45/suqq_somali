
import 'package:suuq_somali/models/all_category_list.dart';
import 'package:http/http.dart'as http;
class ALLCategoryScreenService {

  Future<AllCategoryList> fetchCatDetailsData(String slug) async {
    String url = "https://suuq.cwprojects.xyz/api/listings/$slug";

    print("AAAAA: $url");
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var allcat = response.body;
      return allCategoryListFromJson(allcat);

    }else{
      return null;
    }
  }
}
