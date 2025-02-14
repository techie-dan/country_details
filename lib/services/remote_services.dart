
import 'package:http/http.dart' as http;
import 'package:country_details/model/post.dart';

class RemoteService {
  Future<List<Country>?> getCountries() async {
    var client = http.Client();
    var uri = Uri.parse('https://restcountries.com/v3.1/all');

    try {
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        return countryFromJson(response.body);
      }
    } catch (e) {
    
    }
    return null;
  }
}
