import 'package:flutter/material.dart';
import 'components/animated_custom_bottombar.dart';

class CustomLayoutPractice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomHome();
  }
}

class CustomHome extends StatelessWidget {
  final List<String> _listItem = [ "assets/images/image1.jpg", "assets/images/image2.jpg", "assets/images/image3.jpg",
    "assets/images/image4.jpg", "assets/images/image5.jpg", "assets/images/image6.jpg", "assets/images/image7.jpg",
    "assets/images/image8.jpg", "assets/images/image9.jpg","assets/images/image10.jpg" ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.9;
    final double itemWidth = size.width / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Flutter Practice", style: TextStyle(fontSize: 20.0, 
        color: Colors.orange, fontWeight: FontWeight.w700)),
        elevation: 0
      ),
      body: SafeArea (
        child: Container(
          child: Column(
              children: <Widget>[
                //MainScreenCard(),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: (itemWidth / itemHeight),
                    padding: EdgeInsets.all(16.0),
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    children: getImages(),
                  )
              )
              ]
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          print("Fab Pressed")
        },
        child: Icon(Icons.card_travel, color: Colors.white),
        backgroundColor: Colors.indigo,
      ),
      bottomNavigationBar: AnimatedBottomBar(
        onBarTap: (index) {
          print(index);
        }
      )
    );
  }

  List getImages() {
    return _listItem.map((item) => 
    InkWell(
      onTap: () {
        print("Print Image");
      },
      child: Container(
        child: new Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow( color: Colors.black.withOpacity(0.3), blurRadius: 10.0, 
                spreadRadius: 0.1, offset: Offset(0.0, 5.0))
              ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 274,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                  /* boxShadow: [
                    BoxShadow( color: Colors.black.withOpacity(0.3), blurRadius: 10.0, 
                    spreadRadius: 0.1, offset: Offset(0.0, 5.0))
                  ], */
                  image: DecorationImage(
                    image: AssetImage(item),
                    fit: BoxFit.fill
                  )
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      height: 75,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0)
                        )
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text("₹123.61", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade900, 
                            fontSize: 18.0)),
                            SizedBox(height: 2.0),
                            Text("Chocolate Chip Brownie Cake", overflow: TextOverflow.ellipsis, maxLines: 3,
                            style: TextStyle(fontSize: 16.0)),
                          ],
                        )
                      ),
                    )
                  ],
                )

              ),
              /* SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0
                ),
                child: Text("₹123.61", 
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade900, fontSize: 18.0)),
              ),
              SizedBox(height: 5.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0
                  ),
                  child: Text("Chocolate Chip Brownie Cake", overflow: TextOverflow.ellipsis, maxLines: 3,
                  style: TextStyle(fontSize: 16.0)),
                )
              ),
              SizedBox(height: 10.0) */
            ]
          ),
        ),
      )
    )
    ).toList();
  }
}