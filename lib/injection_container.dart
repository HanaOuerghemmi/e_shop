import 'package:e_shop/core/network/network_info.dart';
import 'package:e_shop/features/product/data/datasources/product_local_data_source.dart';
import 'package:e_shop/features/product/data/datasources/product_remote_data_source.dart';
import 'package:e_shop/features/product/data/repositories/product_repository_impl.dart';
import 'package:e_shop/features/product/domain/repositories/product_repository.dart';
import 'package:e_shop/features/product/domain/usecases/get_all_product.dart';
import 'package:e_shop/features/product/presentation/bloc/products/products_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
Future<void> init() async {
  //! features - products

  //? bloc
  sl.registerFactory(() => ProductsBloc(getAllProducts: sl()));

  //? Usecases
  sl.registerLazySingleton(() => getAllProductUsecase(repository: sl()));
  //? Repository
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
      localDataSource: sl(), remoteDataSource: sl(), networkInfo: sl()));
  //? DataSources
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImpl(sharedPreferences: sl()));

  //* CORE
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //* eXTERNAL
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
