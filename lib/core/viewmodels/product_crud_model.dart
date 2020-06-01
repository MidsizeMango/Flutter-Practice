import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/core/models/product_model.dart';
import 'package:flutter_practice/core/services/firestore_api.dart';

import '../../locator.dart';

class ProductCRUDModel extends ChangeNotifier {
  FirestoreAPI _firestoreAPI = FirestoreAPI('products');

  List<Product> products;

  Future<List<Product>> fetchProducts() async {
    var result = await _firestoreAPI.getDataCollection();
    products = result.documents.map((doc) => Product.fromMap(doc.data, doc.documentID)).toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    return _firestoreAPI.streamDataCollection();
  }

  Future<Product> getProductById(String id) async {
    var doc = await _firestoreAPI.getDocumentById(id);
    return Product.fromMap(doc.data, doc.documentID);
  }

  Future removeProduct(String id) async {
    await _firestoreAPI.removeDocument(id);
    return;
  }

  Future updateProduct(Product data, String id) async {
    await _firestoreAPI.updateDocument(data.toJson(), id);
  }

  Future addProduct(Product data) async {
    await _firestoreAPI.addDocument(data.toJson());
  }

  void onChange() {
    notifyListeners();
  }
}