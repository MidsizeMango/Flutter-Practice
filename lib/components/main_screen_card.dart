import 'package:flutter/material.dart';

class MainScreenCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.0),
        image: DecorationImage(
          image: AssetImage('assets/images/image9.jpg'),
          fit: BoxFit.cover
        ),
        boxShadow: [
          BoxShadow( color: Colors.blue.withOpacity(0.4), blurRadius: 40.0, 
          spreadRadius: 0.001, offset: Offset(0.0, 20.0))
        ]
      ),
      child: InkWell(
        splashColor: Colors.orange,
        onTap: () {
          print("Tapped Card");
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.0),
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(0.4),
                Colors.black.withOpacity(0.2)
              ]
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text("Today's Offer", style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.w800 ), 
              textAlign: TextAlign.center),
              SizedBox(height: 30.0),
              Container(
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 40.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow( color: Colors.black.withOpacity(0.5), blurRadius: 50.0, 
                    spreadRadius: 0.01, offset: Offset(0.0, 20.0))
                  ],
                  color: Colors.white
                ),
                child: Center(child: Text("Shop Now", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold), 
                      textAlign: TextAlign.center))
              ),
              SizedBox(height: 30.0),
            ],
          )
        ),
      )
    );
  }

}