import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_booking_system/services/rest.dart';

class RestService implements Rest {
  static const String _baseUrl =
      'https://us-central1-restaurant-booking-syste-a4ca7.cloudfunctions.net/api';

  Future get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
    // throw response;
  }

  Future post(String endpoint, {dynamic data}) async {
    final response = await http.post(Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }
}
