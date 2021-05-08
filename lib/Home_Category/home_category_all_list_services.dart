import 'package:http/http.dart' as http;
import 'package:suuq_somali/models/all_category_list.dart';
import 'package:suuq_somali/models/anything_model.dart';


class HomeCategoryListServices {

  Future<AllCategoryList> fetchCatDetailsData(Cat cat) async {


   String    url = "https://suuq.cwprojects.xyz/api/results?cat_id="+cat.catId;

    print("All Cat service: $url");
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var allcat = response.body;
      return allCategoryListFromJson(allcat);

    }else{
      return null;
    }
  }
}


