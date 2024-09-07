import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helper/api.dart';

class AllCatogoriesService {
  Future<List> getAllCatogirs() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
