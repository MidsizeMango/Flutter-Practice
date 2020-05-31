import 'package:flutter/material.dart';
import 'package:flutter_practice/core/models/product_model.dart';
import 'package:flutter_practice/core/viewmodels/product_crud_model.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  _AddProduct createState() => _AddProduct();
}

class _AddProduct extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  String productTitle;
  String productPrice;
  String productCategory = "Cake";
  String productDescription;
  String productAvgTime;
  String productWeight;
  String productQuantity;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductCRUDModel>(context);
    return SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0)
                ),
                margin: EdgeInsets.only(top: 12.0, bottom: 16.0),
                child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text('Add Product', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    width: 0, 
                                    style: BorderStyle.none,
                                  )
                                ),
                                hintText: 'Product Title',
                                fillColor: Colors.grey.shade300,
                                filled: true),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter Product Title';
                              }
                              return null;
                            },
                            onChanged: (value) => {
                              setState(() => {productTitle = value})
                            },
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            keyboardType: TextInputType.numberWithOptions(),
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    width: 0, 
                                    style: BorderStyle.none,
                                  )
                                ),
                                hintText: 'Product Price',
                                fillColor: Colors.grey.shade300,
                                filled: true),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter Product Price';
                              }
                              return null;
                            },
                            onChanged: (value) => {
                              setState(() => {productPrice = value})
                            },
                          ),
                          SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(6.0),
                              child:DropdownButton<String>(
                                value: productCategory,
                                items: <String>[
                                  'Cake',
                                  'Chocolates',
                                  'Biscuits',
                                  'Cookies'
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String newValue) {
                                  setState(() {
                                    productCategory = newValue;
                                  });
                                }))),
                          SizedBox(height: 12),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    width: 0, 
                                    style: BorderStyle.none,
                                  )
                                ),
                                hintText: 'Product Description',
                                fillColor: Colors.grey.shade300,
                                filled: true),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter Product Description';
                              }
                              return null;
                            },
                            onChanged: (value) => {
                              setState(() => {productDescription = value})
                            },
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    width: 0, 
                                    style: BorderStyle.none,
                                  )
                                ),
                                hintText: 'Average Making Time',
                                fillColor: Colors.grey.shade300,
                                filled: true),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter Average Making Time';
                              }
                              return null;
                            },
                            onChanged: (value) => {
                              setState(() => {productAvgTime = value})
                            },
                          ),
                          SizedBox(height: 16),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    width: 0, 
                                    style: BorderStyle.none,
                                  )
                                ),
                                hintText: 'Product Weight',
                                fillColor: Colors.grey.shade300,
                                filled: true),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter Product Weight';
                              }
                              return null;
                            },
                            onChanged: (value) => {
                              setState(() => {productWeight = value})
                            },
                          ),
                          SizedBox(height: 16.0),
                          Center(
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)
                            ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  await productProvider.addProduct(Product(
                                      name: productTitle,
                                      price: productPrice,
                                      category: productCategory));
                                  Navigator.pop(context);
                                }
                              },
                              splashColor: Colors.green,
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text('Add Product', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white))
                              ),
                              color: Colors.blue))
                        ],
                      ),
                    ))));
  }
}
