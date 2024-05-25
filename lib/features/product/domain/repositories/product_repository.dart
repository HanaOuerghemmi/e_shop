import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failures.dart';
import 'package:e_shop/features/product/domain/entities/product.dart';

abstract class ProductRepository{
  Future<Either<Failure,List<Product>>> getAllProduct();
  
}