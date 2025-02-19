import 'package:flutter/material.dart';
import 'package:flutter_practice/components/animated_custom_bottombar.dart';
import 'package:flutter_practice/core/models/product_model.dart';
import 'package:flutter_practice/core/viewmodels/product_crud_model.dart';
import 'package:flutter_practice/ui/views/add_product.dart';
import 'package:flutter_practice/ui/widgets/category_selector.dart';
import 'package:flutter_practice/ui/widgets/product_card.dart';
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
          title: Text('Home', style: TextStyle(fontSize: 22.0)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () =>
                  {Navigator.pushNamed(context, Constants.CART_ITEMS)},
            ),

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
                      color: Colors.transparent, 
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Explore', style: TextStyle(
                    fontSize: 32.0, fontWeight: FontWeight.bold)),
                ),
                CategorySelector(
                  categories: ['Cakes', 'Chocolates', 'Cookies', 'Biscuits']
                )
              /* Container(
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
          )) */
        ])),
        bottomNavigationBar: AnimatedBottomBar(onBarTap: (index) {
          print(index);
        }));
  }
}
