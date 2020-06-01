import 'package:flutter/material.dart';
import 'package:flutter_practice/core/models/product_model.dart';
import 'package:flutter_practice/ui/views/alternate_product_details.dart';
import 'package:palette_generator/palette_generator.dart';

class ProductCard extends StatefulWidget {
  final Product productDetails;
  final int cardNum;
  ProductCard({@required this.productDetails, @required this.cardNum});
  _ProductCard createState() => _ProductCard();
}

class _ProductCard extends State<ProductCard> {
  Color color = Colors.amber;
  bool favourite = false;

  @override
  void initState() {
    super.initState();
    _getImagePalette(AssetImage('assets/images/image8.jpg'));
  }

  _getImagePalette(AssetImage image) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(image);
    setState(() {
      color = paletteGenerator.vibrantColor.color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AlternateProductDetails(
                          productDetails: widget.productDetails,
                          paletteColor: color)))
            },
        child: Container(
            child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/image8.jpg'),
                              fit: BoxFit.fill),
                          boxShadow: [
                            BoxShadow(
                                color: color.withOpacity(0.4),
                                offset: Offset(0, 8.0),
                                blurRadius: 16)
                          ],
                          borderRadius: BorderRadius.circular(30)),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.95,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [color, Colors.transparent],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                            padding: EdgeInsets.all(24.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(widget.productDetails.name,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 24.0),
                                          overflow: TextOverflow.clip),
                                      SizedBox(height: 10.0),
                                      Text(
                                          '\u{20B9} ${widget.productDetails.price}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 26.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.clip)
                                    ],
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(bottom: 8.0),
                                      child: InkWell(
                                          onTap: () => {
                                            setState(() {
                                              favourite = !favourite;
                                            })
                                          },
                                          child: Icon(
                                            favourite
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: Colors.pink,
                                            size: 36.0,
                                          )))
                                ])),
                      ),
                    ))
          ],
        )));
  }
}
