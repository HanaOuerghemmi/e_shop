import 'dart:convert';

import 'package:e_shop/core/error/exceptions.dart';
import 'package:e_shop/features/product/data/models/product_model.dart';
import 'package:http/http.dart' as http;

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProduct();
}

const BASE_URL = 'https://dummyjson.com';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getAllProduct() async {
    final response = await client.get(
      Uri.parse(BASE_URL + '/products'),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedJson = json.decode(response.body);
            final List productsList = decodedJson['products'] as List;

      final List<ProductModel> productModels = productsList
          .map<ProductModel>(
              (jsonProductModel) => ProductModel.fromJson(jsonProductModel))
          .toList();

      return productModels;
    } else {
      throw ServerException();
    }
  }
}
