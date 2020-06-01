import 'package:flutter/material.dart';
import 'package:flutter_practice/core/models/cart_model.dart';
import 'package:flutter_practice/core/services/shared_preference.dart';
import 'package:flutter_practice/database/dbprovider.dart';
import 'package:toast/toast.dart';
import 'package:uuid/uuid.dart';
import '../../core/models/product_model.dart';

class AlternateProductDetails extends StatefulWidget {
  final Product productDetails;
  final Color paletteColor;
  AlternateProductDetails({this.productDetails, this.paletteColor});

  _AlternateProductDetails createState() => _AlternateProductDetails();
}

class _AlternateProductDetails extends State<AlternateProductDetails> {
  List<String> images = new List<String>();
  String price = '';
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      images.add('assets/images/image8.jpg');
      images.add('assets/images/image9.jpg');
      images.add('assets/images/image1.jpg');
      images.add('assets/images/image2.jpg');
      price = double.parse(widget.productDetails.price).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar:
            AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
          IconButton(
            color: isFavorite ? Colors.red : Colors.black,
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () => {
              setState(() {
                isFavorite = !isFavorite;
              })
            },
          ),
        ]),
        body: Stack(children: <Widget>[
          PageView.builder(
              itemCount: images.length,
              physics: AlwaysScrollableScrollPhysics(),
              controller: PageController(),
              itemBuilder: (buildContext, index) => Image(
                    image: AssetImage(images[index]),
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        widget.paletteColor.withOpacity(0.95),
                        widget.paletteColor.withOpacity(0.75),
                        Colors.transparent
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topCenter,
                      stops: [0.1, 0.45, 1]),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                              child: Container(
                                  child: Text(
                            widget.productDetails.name,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 34.0),
                            overflow: TextOverflow.clip,
                          ))),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Flexible(
                          child: Container(
                              child: Text('\u{20B9} $price',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.clip))),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(widget.productDetails.description,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0),
                          overflow: TextOverflow.clip),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Weight: ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0),
                              overflow: TextOverflow.clip),
                          Text(widget.productDetails.weight,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                              overflow: TextOverflow.clip),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Quantity: ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.0),
                              overflow: TextOverflow.clip),
                          Text(widget.productDetails.quantity,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                              overflow: TextOverflow.clip),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      OutlineButton(
                          onPressed: () async => {
                                await DBProvider.dbProvider
                                    .addProductInCart(getCartData()),
                                Toast.show('Added to Cart', context)
                              },
                          shape: StadiumBorder(),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text('ADD TO CART',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0)),
                          ))
                    ],
                  ),
                ),
              )),
        ]));
  }

  Cart getCartData() {
    return Cart(
        cartId: Uuid().v1().replaceAll('-', '').substring(0, 10),
        productId: widget.productDetails.productId,
        productName: widget.productDetails.name,
        productCategory: widget.productDetails.category,
        productPrice: widget.productDetails.price,
        quantity: widget.productDetails.quantity,
        productImage: '',
        isEggless: 'false',
        extras: '',
        dateTime: new DateTime.now().toString());
  }
}
