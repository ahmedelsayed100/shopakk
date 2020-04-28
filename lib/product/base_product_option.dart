class BaseProductOption {
  String name;
  String value;
  String meta;
  double price;

  BaseProductOption(this.name, this.value, this.meta, this.price);
  BaseProductOption.fromJson(Map<String, dynamic> jsonOject) {
    this.name = jsonOject['name'];
    this.value = jsonOject['value'];
    this.meta = jsonOject['meta'];
    this.price = jsonOject['price'];
  }
}
