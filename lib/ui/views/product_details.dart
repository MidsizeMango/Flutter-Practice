import 'package:flutter/material.dart';
import 'package:flutter_practice/core/models/cart_model.dart';
import 'package:flutter_practice/core/models/product_model.dart';
import 'package:flutter_practice/database/dbprovider.dart';
import 'package:toast/toast.dart';
import 'package:uuid/uuid.dart';

class ProductDetails extends StatelessWidget {
  final Product productDetails;
  ProductDetails({@required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 350.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset(
                    'assets/images/image2.jpg',
                    fit: BoxFit.cover,
                  )),
                )
              ];
            },
            body: SingleChildScrollView(
              child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("${productDetails.name}",
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w200)),
                              SizedBox(height: 10.0),
                              Text("\$${productDetails.price}",
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold))
                            ],
                          )),
                      Container(
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10.0,
                                    spreadRadius: 0.1,
                                    offset: Offset(0.0, 10.0))
                              ]),
                          child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Description',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                  SizedBox(height: 6.0),
                                  Text(
                                    'as dk akjsfabdfjasbdfjkaskdfjk askfkab skdfkasbkfbabsd' 
                                    'faks bfkads bkfabskd fkabs kdfbaksb dfkask akbsfkbaskf',
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ],
                              )))
                    ],
                  )),
            )),
        bottomNavigationBar: 
        Container(
            height: 54.0,
            margin: EdgeInsets.all(10.0),
            child: RaisedButton(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              onPressed: () async => {
                await DBProvider.dbProvider.addProductInCart(getCartData()),
                Toast.show('Added to Cart', context)
              },
              child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Center(
                    child: Text("Add to Cart",
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ) 
              ),
            )
        );
  }

  Cart getCartData() {
    return Cart(
      cartId: Uuid().v1().replaceAll('-', '').substring(0, 10),
      productId: productDetails.productId,
      productName: productDetails.name,
      productCategory: productDetails.category,
      productPrice: productDetails.price,
      quantity: productDetails.quantity,
      productImage: '',
      isEggless: 'false',
      extras: '',
      dateTime: new DateTime.now().toString());
  }
}
