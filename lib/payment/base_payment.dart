class BasePayment {
  String paymentId;
  String amount;
  DateTime paymentDate;
  String paymentMethod;
  BasePayment(
      this.paymentId, this.amount, this.paymentDate, this.paymentMethod);
  BasePayment.fromJson(Map<String, dynamic> jsonObject) {
    this.paymentId = jsonObject['payment_id'];
    this.amount = jsonObject['amount'];
    this.paymentDate = DateTime.parse(jsonObject['payment_date']);
    this.paymentMethod = jsonObject['payment_method'];
  }
}
