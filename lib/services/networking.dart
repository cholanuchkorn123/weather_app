import 'package:http/http.dart' as http;
import 'dart:convert';

class Networkhelper {
  Networkhelper({required this.url});
  final Uri url;

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodeData = jsonDecode(data);

      return decodeData;
    } else {}
  }
}
