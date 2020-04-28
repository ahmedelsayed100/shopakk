import 'package:shopak/product/base_product.dart';

class ProductController {
  BaseProduct products;

  ProductController(this.products);

  static List<BaseProduct> toProduct(List<Map<String, dynamic>> jsonObjects) {}
}
