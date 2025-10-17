import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketa_new/marketa_app.dart';
import 'presentation/authentication/bloc/auth_bloc.dart';
import 'presentation/authentication/bloc/auth_events.dart';
import 'presentation/products/bloc/product detail bloc/product_detail_bloc.dart';
import 'presentation/products/bloc/products_bloc.dart';

class MarketaBlocs extends StatelessWidget {
  const MarketaBlocs({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AppStartedEvent()),
        ),
        BlocProvider(
          create: (context) => ProductsBloc()..add(LoadProductsEvent()),
        ),
        BlocProvider(create: (context) => ProductDetailBloc()),

        // BlocProvider(
        //   create: (context) => ProductBloc()..add(FetchProducts()),
        // ),
        // BlocProvider(
        //   create: (context) => ProductDetailBloc()..add(LoadProductDetail('')),
        // ),
        // BlocProvider(
        //   create: (context) => CartBloc(),
        // ),
        // BlocProvider(
        //   create: (context) => OrderBloc(),
        // ),
      ],
      child: MarketaApp(),
    );
  }
}
