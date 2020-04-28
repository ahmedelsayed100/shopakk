import 'package:shopak/order/base_order.dart';

class OrderController {
  BaseOrder oreders;

  OrderController(this.oreders);

  static List<BaseOrder> toOrder(List<Map<String, dynamic>> jsonObjects) {}
}
