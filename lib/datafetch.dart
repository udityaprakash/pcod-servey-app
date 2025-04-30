import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'pcos-survey-backend.onrender.com';
  final String _baseUrl2 = 'pcos-deployment.onrender.com';

  Future<dynamic> get(String endpoint) async {
    try {
      final url = Uri.https(_baseUrl, endpoint);
      final response = await http.get(url);
      return json.decode(response.body);
    } catch (e) {
      throw Exception('Error during GET request: $e');
    }
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> body,{baseurl}) async {
    try {
      final url = Uri.https(baseurl ?? _baseUrl, endpoint);
      final response = await http.post(
        url,
        body: json.encode(body),
        headers: {'Content-Type': 'application/json'},
      );

      if(baseurl){

        if (response.statusCode == 200) {
          return jsonDecode(response.body);
        } else {
          print("Unexpected response (${response.statusCode}): ${response.body}");
          throw Exception('Unexpected server response');
        }
      }


      return json.decode(response.body);
    } catch (e) {
      throw Exception('Error during POST request: $e');
    }
  }

  Future<String> readText(String endpoint) async {
    try {
      final url = Uri.https(_baseUrl, endpoint);
      return await http.read(url);
    } catch (e) {
      throw Exception('Error reading text: $e');
    }
  }
}
