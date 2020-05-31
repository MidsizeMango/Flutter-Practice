import 'package:flutter/material.dart';
import 'package:flutter_practice/components/animated_custom_bottombar.dart';
import 'package:flutter_practice/core/models/product_model.dart';
import 'package:flutter_practice/core/viewmodels/product_crud_model.dart';
import 'package:flutter_practice/ui/views/add_product.dart';
import 'package:flutter_practice/ui/views/product_card.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';

class HomeView extends StatefulWidget {
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Product> products;
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductCRUDModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () =>
                  {Navigator.pushNamed(context, Constants.CART_ITEMS)},
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber.shade800,
            onPressed: () {
              //Navigator.pushNamed(context, Constants.PRODUCTS);
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext buildContext) {
                    return new Container(
                      color: Colors
                          .transparent, //could change this to Color(0xFF737373),
                      //so you don't have to change MaterialApp canvasColor
                      child: new Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(20.0),
                                  topRight: const Radius.circular(20.0))),
                          child: AddProduct()),
                    );
                  });
            },
            child: Icon(Icons.add)),
        body: Container(
            child: StreamBuilder(
          stream: productProvider.fetchProductsAsStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              products = snapshot.data.documents
                  .map<Product>(
                      (doc) => Product.fromMap(doc.data, doc.documentID))
                  .toList();
              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (buildContext, index) =>
                      ProductCard(productDetails: products[index]));
            } else {
              return Center(
                  child: CircularProgressIndicator(
                key: Key("circularProgressIndictor"),
                backgroundColor: Colors.orange,
              ));
            }
          },
        )),
        bottomNavigationBar: AnimatedBottomBar(onBarTap: (index) {
          print(index);
        }));
  }
}
