class Order {
  String orderId;
  String userId;
  String name;
  List<String> productIds;
  bool isEggless;
  String extras;
  String dateTime;
  String paymentStatus;
  String location;
  String quantity;
  String totalPrice;

  Order({this.orderId, this.userId, this.name, this.productIds, this.isEggless, this.extras, 
  this.dateTime, this.paymentStatus, this.location, this.quantity, this.totalPrice});

  Order.fromMap(Map snapshot,String orderId) :
        orderId = orderId ?? '',
        userId = snapshot['userId'] ?? '',
        totalPrice = snapshot['totalPrice'] ?? '',
        name = snapshot['name'] ?? '',
        productIds = snapshot['productIds'] ?? '',
        isEggless = snapshot['isEggless'] ?? '',
        extras = snapshot['extras'] ?? '',
        dateTime = snapshot['dateTime'] ?? '',
        paymentStatus = snapshot['paymentStatus'] ?? '',
        location = snapshot['location'] ?? '',
        quantity = snapshot['quantity'] ?? '';

  toJson() {
    return {
      "totalPrice": totalPrice,
      "userId": userId,
      "name": name,
      "productIds": productIds,
      "isEggless": isEggless,
      "extras": extras,
      "dateTime": dateTime,
      "paymentStatus": paymentStatus,
      "location": location,
      "quantity": quantity
    };
  }
}