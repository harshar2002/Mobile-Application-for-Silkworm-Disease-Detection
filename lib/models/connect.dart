import 'dart:convert';

import 'package:http/http.dart' as http;

class Connect {
  Future<Map<String, dynamic>> getData() async {
    String url = 'http://192.168.43.70:5000/api/getData';
    var res = await http.post(Uri.parse(url));
    Map<String, dynamic> data = json.decode(res.body);
    return data;
  }
}
