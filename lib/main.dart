
import 'package:e_shop/core/app_theme.dart';
import 'package:e_shop/features/product/presentation/bloc/products/products_bloc.dart';
import 'package:e_shop/features/product/presentation/pages/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di ;
void main() async{
WidgetsFlutterBinding.ensureInitialized();
  
await di.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      
        providers: [ 
          BlocProvider(create: (_) => di.sl<ProductsBloc>()..add(getAllProductEvent())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: appTheme,
          home: ProductPage(),
        ));
  }
}

