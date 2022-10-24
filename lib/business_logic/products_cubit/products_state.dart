part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductFavouriteToggeledState extends ProductsState {}


class ProductFilterChangedState extends ProductsState {
   final List<ProductModel> products;

  ProductFilterChangedState({
    required this.products,
  });
}


class ProductsLoadedState extends ProductsState {
}
