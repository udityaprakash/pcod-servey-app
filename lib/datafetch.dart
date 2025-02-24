import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'pcos-survey-backend.onrender.com';

  Future<dynamic> get(String endpoint) async {
    try {
      final url = Uri.https(_baseUrl, endpoint);
      final response = await http.get(url);
      return json.decode(response.body);
    } catch (e) {
      throw Exception('Error during GET request: $e');
    }
  }
  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    try {
      final url = Uri.https(_baseUrl, endpoint);
      final response = await http.post(
        url,
        body: json.encode(body),
        headers: {'Content-Type': 'application/json'},
      );

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