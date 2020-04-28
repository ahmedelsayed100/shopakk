import 'package:shopak/category/base_category.dart';

class CategoryController {
  BaseCategory category;
  CategoryController(this.category);
  static List<BaseCategory> toCategory(
      List<Map<String, dynamic>> jsonObjects) {}
}
