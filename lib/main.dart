import 'package:flutter/material.dart';
import 'package:flutter_practice/constants.dart';
import 'package:flutter_practice/locator.dart';
import 'package:flutter_practice/ui/router.dart';
import 'package:provider/provider.dart';
import 'core/viewmodels/order_crud_model.dart';
import 'core/viewmodels/product_crud_model.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => locator<ProductCRUDModel>()),
          ChangeNotifierProvider(create: (_) => locator<OrderCRUDModel>())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Practice',
          initialRoute: Constants.INITIAL_PAGE,
          theme: ThemeData(
            fontFamily: 'Montserrat',
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: Router.generateRoute,
        ));
  }
}
