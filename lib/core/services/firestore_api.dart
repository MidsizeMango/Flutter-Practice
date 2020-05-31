import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreAPI {
  final Firestore _firestoreDB = Firestore.instance;
  final String path;
  CollectionReference collectionReference;

  FirestoreAPI( this.path ) {
    collectionReference = _firestoreDB.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return collectionReference.getDocuments();
  }

  Future<QuerySnapshot> getDataBasedOnCondition(String condition, String id) {
    return collectionReference.where(condition, isEqualTo: id).getDocuments();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return collectionReference.snapshots();
  }

  Future<DocumentSnapshot> getDocumentById(String id) {
    return collectionReference.document(id).get();
  }

  Future<DocumentReference> addDocument(Map data) {
    return collectionReference.add(data);
  }

  Future<void> updateDocument(Map data, String id) {
    return collectionReference.document(id).updateData(data);
  }

  Future<void> removeDocument(String id) {
    return collectionReference.document(id).delete();
  }
}