import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {
  /// baseUrl
  static const BASEURL = 'door-hub-production.up.railway.app';

  /// APIS
  static String apiRegisterUser = '/auth/register';


  /// Headers
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  /// Methods
  static Future<String?> GET(String api, Map<String, String> params) async {
    final url = Uri.https(BASEURL, api, params);
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> body) async {
    Uri url = Uri.https(BASEURL, api);
    final response = await http.post(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> body, Map<String, dynamic> param) async {
    final url = Uri.https(BASEURL, api, param);
    final response = await http.put(url, body: jsonEncode(body), headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async {
    final url = Uri.https(BASEURL, api, params);
    final response = await http.delete(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  /// params

  static Map<String, String> emptyParams() => const <String, String>{};


  /// body

  static Map<String, dynamic> bodyEmpty() => const <String, dynamic>{};

  static Map<String, dynamic> bodyRegisterUser({required String firstName, required String lastName, required String phoneNumber, required String email}) => <String, dynamic>{
      "firstname": firstName,
      "lastname": lastName,
      "phoneNumber": phoneNumber,
      "email": email
  };
}
