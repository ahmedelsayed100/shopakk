import 'package:shopak/order/base_order.dart';
import 'package:shopak/order/oreder_controller.dart';
import 'package:shopak/product/base_product.dart';
import 'package:shopak/product/product_controller.dart';
import 'package:shopak/user/user.dart';

import 'address.dart';

class Customer extends User {
  Address shippingAddress;
  Address billingAddress;
  List<BaseOrder> orders;
  List<BaseProduct> watchList;

  Customer(
    String id,
    String firstName,
    String lastName,
    String email,
    String phone,
    String gender,
    Address shippingAddress,
    Address billingAddress,
    List<BaseOrder> orders,
    List<BaseProduct> watchList,
  ) : super(id, firstName, lastName, email, phone, gender) {
    this.shippingAddress = shippingAddress;
    this.billingAddress = billingAddress;
    this.orders = orders;
    this.watchList = watchList;
  }

  Customer.formJson(Map<String, dynamic> jsonObject)
      : super(
          jsonObject['id'],
          jsonObject['first_name'],
          jsonObject['last_name'],
          jsonObject['email'],
          jsonObject['phone'],
          jsonObject['gender'],
        ) {
    this.shippingAddress = Address.fromJson(jsonObject['shipping_address']);
    this.billingAddress = Address.fromJson(jsonObject['billing_address']);
    ProductController.toProduct(jsonObject['watch_list']);
    OrderController.toOrder(jsonObject['orders']);
  }
}
