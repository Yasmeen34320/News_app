import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/ll_news_model/ll_news_model.dart';

class AllNewsApp {
  Future<LlNewsModel?> getAllnews() async {
    try {
      var response = await http.get(Uri.parse(
          "https://newsapi.org/v2/everything?q=tesla&from=2023-06-24&sortBy=publishedAt&apiKey=ea98c3b10d904258ad3d5cfd0ed7ca4b"));
      Map<String, dynamic> decodedresponse = json.decode(response.body);
      if (response.statusCode == 200) {
        LlNewsModel data = LlNewsModel.fromJson(decodedresponse);
        return data;
      } else {
        print("request failed");
        return null;
      }
    } catch (error) {
      print("erroe:$error");
      return null;
    }
  }
}
