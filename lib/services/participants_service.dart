import 'dart:convert';

import 'package:voco_case/utils/api_constants.dart';
import 'package:voco_case/models/participants_list_model.dart';
import 'package:http/http.dart' as http;

class ParticipantsService {
  ParticipantsService._();
  static final instance = ParticipantsService._();
  static var client = http.Client();

  static Future otpLogin(String email, String password,) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json'
    };

    try {
      var url = Uri.parse(ApiConstants.mBaseURL + ApiConstants.login);
      var response = await client.post(
        url,
        headers: requestHeaders,
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      Map<String, dynamic> result = jsonDecode(response.body);
      //dynamic result = jsonDecode(response.body);
      return result;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<ListModel?> getParticipants() async {
    const url = ApiConstants.mBaseURL + ApiConstants.unknown;
    var uri = Uri.parse(url);
    var response = await client.get(uri);

    try {
      if (response.statusCode == 200) {
        var json = response.body;
        return listModelFromJson(json);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }


}
