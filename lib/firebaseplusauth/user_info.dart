import 'package:flutter/material.dart';
import 'package:flutter_practice/firebaseplusauth/firebaseauth_practice.dart';
import 'google_signin_service.dart';

class UserInfo extends StatelessWidget{
  //final FirebaseUser currentUser = GoogleSignInService.user.data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Google Auth Home", style: TextStyle(fontSize: 20.0, 
        color: Colors.indigo, fontWeight: FontWeight.w700)),
        elevation: 0
      ),
      body: SafeArea (
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                 "",
                ),
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 10.0),
              Text(""),
              SizedBox(height: 10.0),
              Text(""),
              SizedBox(height: 10.0),
              FlatButton(
                onPressed: () => {
                  GoogleSignInService.signOutGoogle().whenComplete(() {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return FirebaseAuthPractice();
                        },
                      ),
                    );
                  })
                }, 
                child: Text("Sign Out"),
                color: Colors.red,
              ),
              SizedBox(height: 10.0)
            ],
          )
        )
      )
    );
  }

}