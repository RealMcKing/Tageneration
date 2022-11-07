import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class MainViewModel extends ChangeNotifier {
  final User? user = FirebaseAuth.instance.currentUser;

  int selectedIndex = 0;

  void onItemTapped(int index) {
    if (selectedIndex == index) return;
    selectedIndex = index;
    notifyListeners();
  }


}
