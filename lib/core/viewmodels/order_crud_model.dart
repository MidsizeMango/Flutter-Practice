import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/core/models/order_model.dart';
import 'package:flutter_practice/core/services/firestore_api.dart';

import '../../locator.dart';

class OrderCRUDModel extends ChangeNotifier {
  FirestoreAPI _firestoreAPI = FirestoreAPI('orders');

  List<Order> orders;

  Future<List<Order>> fetchOrders() async {
    var result = await _firestoreAPI.getDataCollection();
    orders = result.documents
        .map((doc) => Order.fromMap(doc.data, doc.documentID))
        .toList();
    return orders;
  }

  Future<List<Order>> fetchOrdersForUser(String userId) async {
    var result = await _firestoreAPI.getDocumentsCollection(userId, 'orders');
    List<Order> userOrders = result.documents
        .map((doc) => Order.fromMap(doc.data, doc.documentID))
        .toList();
    return userOrders;
  }

  Future<Order> getOrderById(String userId, String id) async {
    var doc = await _firestoreAPI.getDocumentCollectionById(userId, 'order', id);
    return Order.fromMap(doc.data, doc.documentID);
  }

  Future removeOrder(String id, String userId) async {
    await _firestoreAPI.removeDocumentCollection(userId, 'order', id);
    return;
  }

  Future updateOrder(Order data, String id, String userId) async {
    await _firestoreAPI.updateDocumentToCollection('order', data.toJson(), userId, id);
  }

  Future addOrder(Order data, String userId) async {
    await _firestoreAPI.addDocumentToCollection(userId, 'orders', data.toJson());
  }

  void onChange() {
    notifyListeners();
  }
}
