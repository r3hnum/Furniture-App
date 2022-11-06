import 'dart:async';

import 'package:http/http.dart' as http;

import '../models/apiModel.dart';

var url = Uri.parse('http://example.com');

class RemoteService{
  static var client = http.Client();

  static Future<List<ProductData>?> fetchProducts() async{
    var response = await client.get(url);
    if(response.statusCode == 200){
      var jsonString = response.body;
      return productDataFromJson(jsonString);
    }else{
      //show error message
      return null;
    }

  }
}