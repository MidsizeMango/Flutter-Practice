import 'package:firebase_auth/firebase_auth.dart';

class User {
  String id;
  String name;
  String imageUrl;
  String email;

  User({this.id, this.name, this.imageUrl, this.email});
  factory User.create(FirebaseUser data) => User(id: data.uid, name: data.displayName, imageUrl: data.photoUrl, email: data.email);

  factory User.fromMap(Map<String, dynamic> userInfoMap) => User(
    id: userInfoMap["id"] ?? 'asd12e12q2d12f',
    name: userInfoMap["name"] ?? "No Name",
    imageUrl: userInfoMap["imageUrl"] ?? "Image URL",
    email: userInfoMap["email"] ?? "random@random.com"
  );

  Map<String, dynamic> toMap() => {
    "id": this.id,
    "name": this.name,
    "imageUrl": this.imageUrl,
    "email": this.email
  };
}