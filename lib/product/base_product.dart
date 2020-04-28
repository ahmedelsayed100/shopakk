import 'package:shopak/category/base_category.dart';
import 'package:shopak/category/category_controller.dart';
import 'package:shopak/discount/base_discount.dart';
import 'package:shopak/discount/dicount_controller.dart';
import 'package:shopak/images/base_images.dart';
import 'package:shopak/images/image_controller.dart';
import 'package:shopak/product/base_product_option.dart';
import 'package:shopak/product/product_option_controller.dart';
import 'package:shopak/tags/base_tag.dart';
import 'package:shopak/tags/tag_controller.dart';

class BaseProduct {
  String id;
  String title;
  String description;
  double price;
  double quantity;
  List<BaseCategory> categories;
  List<BaseTag> tags;
  List<BaseImage> images;
  List<BaseProductOption> options;
  List<BaseDiscount> discounts;
  BaseProduct(this.id, this.title, this.description, this.price, this.quantity,
      this.categories, this.tags, this.images, this.discounts);
  BaseProduct.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['id'];
    this.title = jsonObject['title'];
    this.description = jsonObject['description'];
    this.price = jsonObject['price'];
    this.quantity = jsonObject['quantity'];
    this.categories = CategoryController.toCategory(jsonObject['categories']);
    this.tags = TagController.toTag(jsonObject['tags']);
    this.images = ImageController.toImage(jsonObject['images']);
    this.discounts = DiscountController.toDiscount(jsonObject['discounts']);
    this.options = OptionController.toOption(jsonObject['options']);
  }
}
