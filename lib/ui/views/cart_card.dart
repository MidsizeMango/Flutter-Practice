import 'package:flutter/material.dart';
import 'package:flutter_practice/core/models/cart_model.dart';

class CartCard extends StatelessWidget {
  final Cart cartDetails;
  CartCard({this.cartDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
    child: Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: [
          Hero(
              tag: cartDetails.cartId,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.30,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/image2.jpg'),
                    fit: BoxFit.fill
                  )
                )
              )),
          Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cartDetails.productName,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                          fontStyle: FontStyle.italic)),
                  SizedBox(height: 10.0),
                  Text(
                    '\$${cartDetails.productPrice}',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        color: Colors.orangeAccent),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    cartDetails.itemCount.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        color: Colors.green),
                  ),
                ],
              ))
        ],
      ),
    )));
  }
}
