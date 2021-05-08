import 'package:http/http.dart' as http;
import 'package:suuq_somali/models/all_ads_model.dart';

class AllAdsService {
  Future<AllAds> fetchData() async {
    String url = "https://suuq.cwprojects.xyz/api/listings";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var allAds = response.body;
      return allAdsFromJson(allAds);
    } else {
      return null;
    }
  }
}
