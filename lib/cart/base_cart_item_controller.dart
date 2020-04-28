import 'package:shopak/cart/base_cart_item.dart';

class BaseCartItemControlller {
  BaseCartItem baseCartItem;
  BaseCartItemControlller(this.baseCartItem);
  static List<BaseCartItem> toBaseCartItems(
      List<Map<String, dynamic>> jsonObjects) {}
}
