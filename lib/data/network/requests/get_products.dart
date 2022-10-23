import 'package:magdsoft_flutter_structure/data/data_providers/remote/dio_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/product_model.dart';

const getProuductsUrl = '/getProducts';

class GetProducts {
  static Future<List<ProductModel>> getProducts() async {
    final response = await DioHelper.getData(url: getProuductsUrl, query: {});
    List<dynamic> encodedProducts = response.data['products'];
    final products = encodedProducts
        .map((product) => ProductModel.fromJson(product))
        .toList();
    return products;
  }
}
