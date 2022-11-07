import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:tageneration/ui/navigation/main_navigation.dart';

class ProductListViewModel extends ChangeNotifier {
  void createProduct(BuildContext context) {
    Navigator.pushNamed(context, MainNavigationRouteNames.addProductScreen);
  }


}
