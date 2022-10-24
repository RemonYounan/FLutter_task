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
  late List<ProductModel> filteredProducts;
  String selectedFilter = 'All';

  Future<void> getProducts() async {
    emit(ProductsLoadingState());
    selectedFilter = 'All';
    final isConnected = await InternetConnectionCheckerPlus().hasConnection;
    if (isConnected) {
      products = await GetProducts.getProducts();
      final productsToJson =
          products.map((product) => product.tojson()).toList();
      CacheHelper.saveDataSharedPreference(
          key: 'PRODUCTS', value: json.encode(productsToJson));
      emit(ProductsLoadedState());
    } else {
      final productsString =
          await CacheHelper.getDataFromSharedPreference(key: 'PRODUCTS');
      final List productsJson = json.decode(productsString);
      products = productsJson
          .map((product) => ProductModel.fromJson(product))
          .toList();

      emit(ProductsLoadedState());
    }
  }

  void toggleFavorite(int productId) {
    final product = products.firstWhere((product) => product.id == productId);
    product.isFavorite = !product.isFavorite;
    emit(ProductFavouriteToggeledState());
  }

  void getFilteredProducts(String filter) async {
    emit(ProductsLoadingState());
    selectedFilter = filter;
    if (filter == 'All') {
      filteredProducts = products;
      emit(ProductFilterChangedState(products: products));
    } else {
      filteredProducts =
          products.where((element) => element.company == filter).toList();
      emit(ProductFilterChangedState(products: filteredProducts));
    }
  }
}
