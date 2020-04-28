class Address {
  String streetName, streetNumber, city, state, country, postcode;

  Address.fromJson(Map<String, dynamic> jsonObject) {
    this.streetName = jsonObject["street_name"];
    this.streetNumber = jsonObject["street_number"];
    this.city = jsonObject["city"];
    this.state = jsonObject["state"];
    this.country = jsonObject["country"];
    this.postcode = jsonObject["post_code"];
  }
}
