import 'dart:convert';
import 'item_model.dart';
import 'package:http/http.dart' as http;

class ApiService {

  static const baseUrl = '10.0.2.2:8000/';
  static const jsonUrl = 'json/';

  Future<List<Item>> getItem() async {
    var url = Uri.parse(
        'http://$baseUrl$jsonUrl');
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<Item> listItem = [];
    for (var d in data) {
      if (d != null) {
        listItem.add(Item.fromJson(d));
      }
    }
    return listItem;
  }
}