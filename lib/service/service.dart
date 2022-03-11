import 'dart:convert';
import 'package:cardexam/model/model.dart';
import 'package:http/http.dart';

class Network{

  static String baseApi = "622ae75a14ccb950d2286bfc.mockapi.io";

  static Map<String, String> headers = {'Content-type': 'application/json; charset=UTF-8',};


  /* Http Requests */
  ///mock api Khurshidbek aka

  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(baseApi, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) return response.body;
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async{
    var uri = Uri.https(baseApi, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, dynamic> params) async{
    var uri = Uri.https(baseApi, api, params);
    var response = await delete(uri, headers: headers);
    if(response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Apis */
  static String API_GET = "/api/card";
  static String API_POST = "/api/card";
  static String API_DELETE = "/api/card/"; //{id}

  /* Http Params */
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, dynamic> paramsPost(ModelCard card) {
    Map<String, dynamic> params = {};
    params.addAll({
      'cardNumber': card.cardNumber,
      'cardHolder': card.cardHolder,
      'cvv2': card.cvv2,
      'expiredDate': card.expiredDate,
    });
    return params;
  }

  /* Http parsing */
  static List<ModelCard> parseResponse(String response) {
    List json = jsonDecode(response);
    List<ModelCard> cards = List<ModelCard>.from(json.map((x) => ModelCard.fromJson(x)));
    return cards;
  }
}