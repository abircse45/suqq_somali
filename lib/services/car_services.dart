import 'package:http/http.dart' as http;
import 'package:suuq_somali/models/car_model.dart';

class CarService {
  Future<Car> fetchData() async {
    String url = "https://suuq.cwprojects.xyz/api/car";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var car = response.body;
      return carFromJson(car);
    }else{
      return null;
    }
  }
}


