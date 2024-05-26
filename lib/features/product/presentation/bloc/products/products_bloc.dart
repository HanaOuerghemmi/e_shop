import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failures.dart';
import 'package:e_shop/features/product/domain/entities/product.dart';
import 'package:e_shop/features/product/domain/usecases/get_all_product.dart';
import 'package:e_shop/features/product/domain/usecases/search_product_usecase.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final getAllProductUsecase getAllProducts;
  final SearchProductUsecase searchProducts;

  ProductsBloc({
    required this.getAllProducts,
    required this.searchProducts,
  }) : super(ProductsInitial());

  @override
  Stream<ProductsState> mapEventToState(ProductsEvent event) async* {
    if (event is RefreshProductEvent) {
      yield LoadingProductsState();
      final failureOrProducts = await getAllProducts();
      yield _mapFailureOrProductsToState(failureOrProducts);
    } else if (event is SearchProductEvent) {
      yield LoadingProductsState();
      final failureOrProducts = await searchProducts(event.productName);
      yield _mapFailureOrProductsToState(failureOrProducts);
    } else if (event is getAllProductEvent) {
      yield LoadingProductsState();
      final failureOrProducts = await getAllProducts();
      yield _mapFailureOrProductsToState(failureOrProducts);
    }
  }

  ProductsState _mapFailureOrProductsToState(Either<Failure, List<Product>> either) {
    return either.fold(
      (failure) => ErrorProductsState(message: _mapFailureToMessage(failure)),
      (products) => LoadedProductsState(products: products),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    // Map failure to a user-friendly message
    return failure.toString();
  }
}
