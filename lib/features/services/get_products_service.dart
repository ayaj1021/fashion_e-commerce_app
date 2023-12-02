import 'package:dio/dio.dart';
import 'package:fashion_ecommerce_app/features/models/get_all_products_model.dart';
import 'package:flutter/material.dart';

class GetProductsService {
  Future<List<GetAllProductsModel>> getProducts() async {
    Dio dio = Dio();
    List<GetAllProductsModel> allProducts = [];
    String url = 'https://fakestoreapi.com/products';

    var response = await dio.get(url);
    debugPrint(response.data);
    try {
      if (response.statusCode == 200) {
        debugPrint(response.statusCode.toString());
        allProducts = response.data;

        //.toList();
      } else {
        debugPrint('Failed');
        debugPrint(response.data);
        debugPrint(response.statusCode.toString());
      }
      return allProducts;
    } catch (e) {
      throw Exception('Error $e');
    }
  }
}
