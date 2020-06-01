import 'package:flutter/material.dart';
import 'package:flutter_practice/core/models/cart_model.dart';
import 'package:flutter_practice/database/dbprovider.dart';
import 'package:flutter_practice/ui/widgets/cart_card.dart';
import 'package:toast/toast.dart';

class CartView extends StatefulWidget {
  _CartView createState() => _CartView();
}

class _CartView extends State<CartView> {
  List<Cart> cartItems = new List<Cart>();
  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
            child: FutureBuilder(
                future: DBProvider.dbProvider.getAllItemsInCart(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    cartItems = snapshot.data;
                    totalPrice = cartItems
                        .map((item) => double.parse(item.productPrice))
                        .reduce((value, element) => value + element);
                    return ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (buildContext, index) =>
                            CartCard(cartDetails: cartItems[index]));
                  } else {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                              child: Text('No Items in Cart',
                                  style: TextStyle(fontSize: 20.0))),
                          SizedBox(height: 16.0),
                          RaisedButton(
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              onPressed: () {},
                              child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text('Continue Shopping',
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.white))))
                        ]);
                  }
                })),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10.0,
                    spreadRadius: 0.1,
                    offset: Offset(0.0, 5.0))
              ]),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Total Price: ', style: TextStyle(fontSize: 22.0)),
                    Text('\$$totalPrice',
                        style: TextStyle(
                            fontSize: 28.0, fontWeight: FontWeight.bold))
                  ]),
              SizedBox(height: 24.0),
              RaisedButton(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: () async => {Toast.show('Order Placed', context)},
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text("Place Order",
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  )),
            ]),
          ),
        ));
  }
}
