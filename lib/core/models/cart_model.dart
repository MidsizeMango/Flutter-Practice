class Cart {
  String cartId;
  String productId;
  String productName;
  String productImage;
  String productCategory;
  String productPrice;
  String quantity;
  String isEggless;
  String extras;
  String dateTime;
  int itemCount;

  Cart({
    this.cartId,
    this.productId,
    this.productName,
    this.productImage,
    this.productCategory,
    this.productPrice,
    this.dateTime,
    this.extras,
    this.isEggless,
    this.quantity,
    this.itemCount
  });

  factory Cart.fromMap(Map<String, dynamic> cartMap) => Cart(
    cartId: cartMap["cartId"],
    productId: cartMap["productId"],
    productName: cartMap["productName"],
    productImage: cartMap["productImage"],
    productCategory: cartMap["productCategory"],
    productPrice: cartMap["productPrice"],
    dateTime: cartMap["dateTime"],
    extras: cartMap["extras"],
    isEggless: cartMap["isEggless"],
    quantity: cartMap["quantity"],
    itemCount: cartMap["itemCount"]
  );

  Map<String, dynamic> toMap() => {
    "cartId": cartId,
    "productId": productId,
    "productName": productName,
    "productCategory": productCategory,
    "productImage": productImage,
    "productPrice": productPrice,
    "dateTime": dateTime,
    "extras": extras,
    "isEggless": isEggless,
    "quantity": quantity,
    "itemCount": itemCount
  };
}
