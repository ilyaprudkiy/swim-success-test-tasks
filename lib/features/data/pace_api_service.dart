import 'dart:convert';
import 'package:http/http.dart' as http;

class PaceApiService {
  PaceApiService(this._client);

  final http.Client _client;

  Future<void> sendPace(int paceSeconds) async {
    try {
      final response = await _client.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'pace_seconds': paceSeconds}),
      );

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('Failed to send pace');
      }
    } catch (e) {
      throw Exception('Failed to send pace: $e');
    }
  }
}
