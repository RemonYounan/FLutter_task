import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/get_products.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  late List<ProductModel> products;

  Future<void> getProducts() async {
    emit(ProductsLoadingState());
    final isConnected = await InternetConnectionCheckerPlus().hasConnection;
    if (isConnected) {
      final List<ProductModel> products = await GetProducts.getProducts();
      this.products = products;
      final productsToJson =
          products.map((product) => product.tojson()).toList();
      CacheHelper.saveDataSharedPreference(
          key: 'PRODUCTS', value: json.encode(productsToJson));
      emit(ProductsLoadedState(products: products));
    } else {
      final productsString =
          await CacheHelper.getDataFromSharedPreference(key: 'PRODUCTS');
      final List productsJson = json.decode(productsString);
      final List<ProductModel> products = productsJson
          .map((product) => ProductModel.fromJson(product))
          .toList();
      this.products = products;
      emit(ProductsLoadedState(products: products));
    }
  }

  void toggleFavorite(int productId) {
    final product = products.firstWhere((product) => product.id == productId);
    product.isFavorite = !product.isFavorite;
    emit(ProductFavouriteToggeledState());
  }
}
