import 'package:flutter/material.dart';

import 'package:tageneration/domain/factory/screen_factory.dart';

abstract class MainNavigationRouteNames {
  static const loaderScreen = 'loader';
  static const authScreen = "auth";
  static const mainScreen = "/";
  static const productListScreen = '/productList';
  static const addProductScreen = '/productList/addProduct';
}

class MainNavigation {
  static final _screenFactory = ScreenFactory();
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.productListScreen: (_) =>
        _screenFactory.makeProductList(),
    MainNavigationRouteNames.addProductScreen: (_) =>
        _screenFactory.makeAddProduct(),
    MainNavigationRouteNames.authScreen: (_) => _screenFactory.makeAuth(),
    MainNavigationRouteNames.loaderScreen: (_) => _screenFactory.makeLoader(),
    MainNavigationRouteNames.mainScreen: (_) => _screenFactory.makeMain(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        const widget = Text("Navigation Error");
        return MaterialPageRoute(builder: (_) => widget);
    }
  }
}
