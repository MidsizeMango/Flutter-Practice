import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/core/models/order_model.dart';
import 'package:flutter_practice/core/services/firestore_api.dart';

import '../../locator.dart';

class OrderCRUDModel extends ChangeNotifier {
  FirestoreAPI _firestoreAPI = locator<FirestoreAPI>();

  List<Order> orders;

  Future<List<Order>> fetchOrders() async {
    var result = await _firestoreAPI.getDataCollection();
    orders = result.documents
        .map((doc) => Order.fromMap(doc.data, doc.documentID))
        .toList();
    return orders;
  }

  Future<List<Order>> fetchOrdersForUser(String id) async {
    var result = await _firestoreAPI.getDataBasedOnCondition("userId", id);
    List<Order> userOrders = result.documents
        .map((doc) => Order.fromMap(doc.data, doc.documentID))
        .toList();
    return userOrders;
  }

  Stream<QuerySnapshot> fetchOrdersAsStream() {
    return _firestoreAPI.streamDataCollection();
  }

  Future<Order> getOrderById(String id) async {
    var doc = await _firestoreAPI.getDocumentById(id);
    return Order.fromMap(doc.data, doc.documentID);
  }

  Future removeOrder(String id) async {
    await _firestoreAPI.removeDocument(id);
    return;
  }

  Future updateOrder(Order data, String id) async {
    await _firestoreAPI.updateDocument(data.toJson(), id);
  }

  Future addOrder(Order data) async {
    await _firestoreAPI.addDocument(data.toJson());
  }

  void onChange() {
    notifyListeners();
  }
}
