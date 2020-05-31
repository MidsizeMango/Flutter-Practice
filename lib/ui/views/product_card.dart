import 'package:flutter/material.dart';
import 'package:flutter_practice/core/models/product_model.dart';
import 'package:flutter_practice/ui/views/product_details.dart';

class ProductCard extends StatelessWidget {
  final Product productDetails;
  ProductCard({@required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
          Navigator.push(context, MaterialPageRoute(builder: (_) => 
            ProductDetails(productDetails: productDetails))
          )
        },
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      Hero(
                        tag: productDetails.productId,
                        child: Image.asset(
                          'assets/images/image1.jpg',
                          height: MediaQuery.of(context).size.height * 0.25,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(productDetails.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 22,
                                      fontStyle: FontStyle.italic)),
                              Text(
                                '\$${productDetails.price}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 22,
                                    color: Colors.orangeAccent),
                              ),
                              Text(
                                productDetails.category,
                                style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 22,
                                    color: Colors.green),
                              ),
                            ],
                          ))
                    ],
                  )),
            )));
  }
}
