import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<dynamic> get(
    String endPoint, {
    Map<String, String>? headers,
  }) async {
    final url = Uri.parse("${dotenv.env['BASE_URL']}$endPoint");
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      print("response success: ${response.statusCode}");
      return jsonDecode(response.body);
    } else {
      print("response error: ${response.statusCode}");
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
