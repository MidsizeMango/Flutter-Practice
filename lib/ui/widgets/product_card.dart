import 'package:flutter/material.dart';
import 'package:flutter_practice/core/models/product_model.dart';
import 'package:flutter_practice/ui/views/product_details.dart';
import 'package:palette_generator/palette_generator.dart';

class ProductCard extends StatefulWidget {
  final Product productDetails;
  final int cardNum;
  ProductCard({@required this.productDetails, @required this.cardNum});
  _ProductCard createState() => _ProductCard();
}

class _ProductCard extends State<ProductCard> {
  Color color = Colors.amber;

  @override
  void initState() {
    super.initState();
    _getImagePalette(AssetImage('assets/images/image2.jpg'));
  }

  _getImagePalette (AssetImage image) async {
    final PaletteGenerator paletteGenerator = await PaletteGenerator
        .fromImageProvider(image);
    setState(() {
      color = paletteGenerator.dominantColor.color;      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.95,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/image2.jpg'),
                      fit: BoxFit.fill
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 5.0),
                          blurRadius: 8)
                    ],
                    borderRadius: BorderRadius.circular(30)),
                    child: Container( 
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [ color, Colors.transparent ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter
                        ),
                        borderRadius: BorderRadius.circular(30)
                      ),
                    ),
                ))
          ],
        ));
  }
}
