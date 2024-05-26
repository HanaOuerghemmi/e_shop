import 'package:dartz/dartz.dart';
import 'package:e_shop/core/error/failures.dart';
import 'package:e_shop/features/cart/domain/entities/cart.dart';
import 'package:e_shop/features/cart/domain/repositories/cart_repository.dart';

class AddCartUseCase{
  final CartRepository repository;
  AddCartUseCase({required this.repository});

  Future<Either<Failure, void>> call(CartItem params) async {
    return await repository.addToCart(params);
  }
}

class ClearCartUseCase{
  final CartRepository repository;
  ClearCartUseCase({required this.repository});

  Future<Either<Failure, bool>> call() async {
    return await repository.clearCart();
  }
}

