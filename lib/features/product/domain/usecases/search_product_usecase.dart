import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failures.dart';
import 'package:e_shop/features/product/domain/entities/product.dart';
import 'package:e_shop/features/product/domain/repositories/product_repository.dart';

class SearchProductUsecase{
  final ProductRepository repository;


  SearchProductUsecase( {
    required this.repository,
    
    
    });
 Future<Either<Failure, List<Product>>> call(String productName) async {
    return await repository.searchProducts(productName);
  }
}