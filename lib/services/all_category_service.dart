import 'package:http/http.dart' as http;
import 'package:suuq_somali/models/all_ads_model.dart';
import 'package:suuq_somali/models/all_category_list.dart';
import 'package:suuq_somali/models/anything_model.dart';


class ALLCategoryService {

  Future<AllCategoryList> fetchCatDetailsData(Cat cat, StateValue stateValue) async {
    String url;
    if(stateValue == null) {
       url = "https://suuq.cwprojects.xyz/api/results?cat_id="+cat.catId;
    }else{
      url = "https://suuq.cwprojects.xyz/api/results?cat_id="+cat.catId+"&City="+stateValue.stateId;
    }
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


