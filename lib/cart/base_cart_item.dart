import 'package:shopak/product/base_product.dart';
// import 'package:shopak/product/base_product.dart';

class BaseCartItem {
  BaseProduct product;
  double quantity;
  BaseCartItem(this.product, this.quantity);
  BaseCartItem.fromJson(Map<String, dynamic> jsonObject) {
    this.product = BaseProduct.fromJson(jsonObject['products']);
    this.quantity = jsonObject['quantity'];
  }
  double discount() {}
}
