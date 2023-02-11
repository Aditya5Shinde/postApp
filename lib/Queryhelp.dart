import 'package:http/http.dart'as http ;
import 'dart:convert';

class Network {

  Network();

  Future  getInfo() async {

    Map useless = {
      "success": {
        "message": "Welcome to JSON Viewer Pro",
        "status_code": 200
      }
    };

    try {
      http.Response response = await http.get(Uri.parse(
          'https://techcrunch.com/wp-json/wp/v2/posts?per_page=2&page=4'));
      if (response.statusCode == 200) {
        String information = response.body;
        print(information);
        List jsonData;
        jsonData = jsonDecode(information);
        jsonData.length;
        return jsonData;
      }
      else {
        return useless;
      }
    } catch (e) {
      print(e);
    }


  }
}