import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/data model/products_model.dart';
import '../repository/products_repo.dart';

part 'products_events.dart';
part 'products_states.dart';

class ProductsBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepo = ProductRepository();

  ProductsBloc() : super(ProductInitial()) {
    on<LoadProductsEvent>(_loadProducts);
    on<BookmarkProductEvent>(_bookmarkProduct);
  }

  Future<void> _loadProducts(
      LoadProductsEvent event, Emitter<ProductState> emit) async {
    emit(ProductsLoading());
    try {
      final products = await productRepo.fetchProducts();
      emit(ProductSuccess(
        products,
        message: 'Products fetched successfully!',
      ));
      debugPrint('Products Loaded:$products');
    } catch (e) {
      emit(ProductFailure(error: e.toString()));
      debugPrint('Error:${e.toString()}');
    }
  }

  Future<void> _bookmarkProduct(
      BookmarkProductEvent event, Emitter<ProductState> emit) async {
    // You can integrate Hive, Isar, or get_storage here
    // Example: save or remove product ID locally
  }
}
