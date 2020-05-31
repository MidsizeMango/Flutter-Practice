import 'package:flutter/material.dart';
import 'package:flutter_practice/core/models/product_model.dart';
import 'package:flutter_practice/ui/views/product_details.dart';

class ProductCard extends StatelessWidget {
  final Product productDetails;
  final int cardNum;
  ProductCard({@required this.productDetails, @required this.cardNum});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.95,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/image2.jpg'),
                      fit: BoxFit.fill
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 5.0),
                          blurRadius: 8)
                    ],
                    borderRadius: BorderRadius.circular(30)),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.red, Colors.transparent] ,
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter
                        ),
                        borderRadius: BorderRadius.circular(30)
                      ),
                    ),
                ))
          ],
        ));
  }
}
