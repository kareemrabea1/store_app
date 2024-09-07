import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:store_app/models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        print('Data: $data'); // تحقق من البيانات
        List<ProductModel> productsList = [];
        for (var item in data) {
          productsList.add(ProductModel.fromJson(item));
        }
        return productsList;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
