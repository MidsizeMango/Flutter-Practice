import 'package:flutter/material.dart';
import '../constants.dart';
import 'google_signin_service.dart';

class FirebaseAuthPractice extends StatefulWidget {
  _FirebaseAuthPracticeLayout createState() => _FirebaseAuthPracticeLayout();
}

class _FirebaseAuthPracticeLayout extends State<FirebaseAuthPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text("Firebase Auth",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.indigo,
                    fontWeight: FontWeight.w700)),
            elevation: 0),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    InkWell(
                        onTap: () => {
                              GoogleSignInService.signInWithGoogle()
                                  .whenComplete(() {
                                Navigator.pushReplacementNamed(
                                    context, Constants.PRODUCTS);
                              })
                            },
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.amber.withOpacity(0.75),
                                    blurRadius: 10.0,
                                    spreadRadius: 0.1,
                                    offset: Offset(0.0, 2.0))
                              ]),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image(
                                  height: 35.0,
                                  image: AssetImage(
                                      "assets/images/google_logo.png")),
                              Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Center(
                                      child: Text('Sign in with Google',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold)))),
                            ],
                          ),
                        ))
                  ],
                ))));
  }
}
