// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseNetwork {
  // static const String baseUrl = "https://berita-tugas.herokuapp.com/search/?q=";
  static const String baseUrl = "https://berita-tugas.herokuapp.com/";

  static Future<Map<String, dynamic>> get(String partUrl) async {
    final String fullUrl = baseUrl + partUrl;
    debugPrint("BaseNetwork - fullUrl : $fullUrl");
    final response = await http.get(Uri.parse(fullUrl));
    debugPrint("BaseNetwork - response : ${response.body}");
    print("============> {BERHASIL MENGAMBIL DATA} => $fullUrl");
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> _processResponse(
      http.Response response) async {
    final body = response.body;
    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      print("processResponse error");
      return {"error": true};
    }
  }

  static void debugPrint(String value) {
    // print("[BASE_NETWORK] - $value");
  }
}
