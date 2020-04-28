import 'package:shopak/cart/base_cart.dart';
import 'package:shopak/payment/base_payment.dart';
import 'package:shopak/user/customer.dart';

class BaseOrder {
  BaseCart cart;
  Customer customer;
  BasePayment basePayment;
  BaseOrder(this.cart, this.customer, this.basePayment);
  BaseOrder.fromJson(Map<String, dynamic> jsonObject) {
    this.customer = Customer.formJson(jsonObject['customer']);
    this.cart = BaseCart.fromJson(jsonObject['cart']);
    this.basePayment = BasePayment.fromJson(jsonObject['base_payment']);
  }
  double total() {}
}
