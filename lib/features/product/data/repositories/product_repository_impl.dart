import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/exceptions.dart';
import 'package:e_shop/core/error/failures.dart';
import 'package:e_shop/core/network/network_info.dart';
import 'package:e_shop/features/product/data/datasources/product_local_data_source.dart';
import 'package:e_shop/features/product/data/datasources/product_remote_data_source.dart';
import 'package:e_shop/features/product/domain/entities/product.dart';
import 'package:e_shop/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource localDataSource;
  final ProductRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Product>>> getAllProduct() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteDataSource.getAllProduct();
        localDataSource.cacheProduct(remoteProducts);
        return Right(remoteProducts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProducts = await localDataSource.getCachedProduct();
        return Right(localProducts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }


  @override
  Future<Either<Failure, List<Product>>> searchProducts(String productName) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteDataSource.getAllProduct();
        final filteredProducts = remoteProducts
            .where((product) => product.title.toLowerCase().contains(productName.toLowerCase()))
            .toList();
        localDataSource.cacheProduct(remoteProducts); // Cache the entire product list, including filtered
        return Right(filteredProducts);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProducts = await localDataSource.getCachedProduct();
        final filteredProducts = localProducts
            .where((product) => product.title.toLowerCase().contains(productName.toLowerCase()))
            .toList();
        return Right(filteredProducts);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }
}
  




