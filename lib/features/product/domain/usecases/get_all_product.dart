
import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failures.dart';
import 'package:e_shop/features/product/domain/entities/product.dart';
import 'package:e_shop/features/product/domain/repositories/product_repository.dart';

class getAllProductUsecase{
  final ProductRepository repository;

  getAllProductUsecase({required this.repository});
 Future<Either<Failure, List<Product>>> call() async {
    return await repository.getAllProduct();
  }
}