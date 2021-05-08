import 'package:http/http.dart' as http;
import 'package:suuq_somali/All_Search/all_search_model.dart';

// class AllSearchService {
//   Future<AllSearch> fetchData(String location ) async {
//     String url = "https://suuq.cwprojects.xyz/api/results$location";
//     var response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       var allAds = response.body;
//       return allSearchFromJson(allAds);
//     } else {
//       return null;
//     }
//   }
// }
class ChangeAllSearchService {
  Future<AllSearch> fetchBottomSearch(String searchText) async {
    String url = "https://suuq.cwprojects.xyz/api/results?s=$searchText";
    print(url);

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var allAds = response.body;
      return allSearchFromJson(allAds);
    } else {
      return null;
    }
  }
}
