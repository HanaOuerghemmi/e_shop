import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failures.dart';
import 'package:e_shop/features/product/domain/entities/product.dart';
import 'package:e_shop/features/product/domain/usecases/get_all_product.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final getAllProductUsecase getAllProducts;

  ProductsBloc({required this.getAllProducts}) : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      if (event is getAllProductEvent) {
        emit(LoadingProductsState());
        final failureOrProducts = await getAllProducts();
        emit(_mapFailureOrProductsToState(failureOrProducts));
      } else if (event is RefreshProductEvent) {
        emit(LoadingProductsState());
        final failureOrProducts = await getAllProducts();

        emit(_mapFailureOrProductsToState(failureOrProducts));
      }
    });
  }

  ProductsState _mapFailureOrProductsToState(
      Either<Failure, List<Product>> either) {
    return either.fold(
      (failure) => ErrorProductsState(message: _mapFailureToMessage(failure)),
      (products) => LoadedProductsState(
        products: products,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'SERVER_FAILURE_MESSAGE';
      case EmptyCacheFailure:
        return 'EMPTY_CACHE_FAILURE_MESSAGE';
      case OfflineFailure:
        return 'OFFLINE_FAILURE_MESSAGE';
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
