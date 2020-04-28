import 'package:shopak/product/base_product_option.dart';

class OptionController {
  BaseProductOption option;
  OptionController(this.option);
  static List<BaseProductOption> toOption(
      List<Map<String, dynamic>> jsonObjects) {}
}
