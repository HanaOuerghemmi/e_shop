import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/exceptions.dart';
import 'package:e_shop/features/product/data/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getCachedProduct();
  Future<Unit> cacheProduct(List<ProductModel> productModels);
}

const CACHED_PRODUCTS = 'CACHED_PRODUCTS';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cacheProduct(List<ProductModel> productModels) {
    // TODO: implement cacheProduct

    List productModelsToJson = productModels
        .map<Map<String, dynamic>>((productModel) => productModel.toJson())
        .toList();
    sharedPreferences.setString(
        CACHED_PRODUCTS, json.encode(productModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<ProductModel>> getCachedProduct() {
    final jsonString = sharedPreferences.getString(CACHED_PRODUCTS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<ProductModel> jsonToProductModels = decodeJsonData
          .map<ProductModel>(
              (jsonProductModel) => ProductModel.fromJson(jsonProductModel))
          .toList();
      return Future.value(jsonToProductModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
