import 'package:shopak/discount/base_discount.dart';

class DiscountController {
  BaseDiscount discount;
  DiscountController(this.discount);
  static List<BaseDiscount> toDiscount(
      List<Map<String, dynamic>> jsonObjects) {}
}
