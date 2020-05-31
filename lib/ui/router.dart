import 'package:flutter/material.dart';
import 'package:flutter_practice/constants.dart';
import 'package:flutter_practice/core/services/shared_preference.dart';
import 'package:flutter_practice/firebaseplusauth/firebaseauth_practice.dart';
import 'package:flutter_practice/firebaseplusauth/user_info.dart';
import 'package:flutter_practice/ui/views/add_product.dart';
import 'package:flutter_practice/ui/views/cart_view.dart';
import 'package:flutter_practice/ui/views/home_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.INITIAL_PAGE:
        {
          return MaterialPageRoute(
              builder: (_) => FutureBuilder<bool>(
                  future: SharedPreference.sharedPref.getBoolValue(Constants.IS_SIGNED_IN),
                  builder: (context, AsyncSnapshot<bool> snapshot) {
                    Widget widget = HomeView();
                    if (snapshot.hasData) {
                      if (!snapshot.data) {
                        widget = FirebaseAuthPractice();
                      }
                    }
                    return widget;
                  }));
        }
      case Constants.PRODUCTS:
        return MaterialPageRoute(builder: (_) => HomeView());
      case Constants.ADD_PRODUCT:
        return MaterialPageRoute(builder: (_) => AddProduct());
      case Constants.PRODUCT_DETAILS:
        return MaterialPageRoute(builder: (_) => FirebaseAuthPractice());
      case Constants.ORDERS:
        return MaterialPageRoute(builder: (_) => FirebaseAuthPractice());
      case Constants.ORDER_DETAILS:
        return MaterialPageRoute(builder: (_) => FirebaseAuthPractice());
      case Constants.ROUTE_USER_INFO:
        return MaterialPageRoute(builder: (_) => UserInfo());
      case Constants.CART_ITEMS:
        return MaterialPageRoute(builder: (_) => CartView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
