part of 'products_bloc.dart';

sealed class ProductState {}

class ProductInitial extends ProductState {}

class ProductsLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<Product> products;
  final String message;

  ProductSuccess(this.products, {required this.message});
}

class SingleProductSuccess extends ProductState {
  final Product product;

  SingleProductSuccess(this.product);
}

class ProductFailure extends ProductState {
  final String error;

  ProductFailure({required this.error});
}
