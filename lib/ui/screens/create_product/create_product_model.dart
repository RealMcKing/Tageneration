import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateProductViewModel extends ChangeNotifier {
  final informationController = TextEditingController();
  final productController = TextEditingController();
  final database = FirebaseFirestore.instance.collection('products');
  final User? user = FirebaseAuth.instance.currentUser;

  Future<void> createProduct(BuildContext context) async {
    String text = informationController.text.trim();

    void removeSpecialSymbols() {}
    // Убрать спецсимволы
    // Посчитать повторения
    // Посчитать уникальные
    // Подпить по убыванию

    List<String> removeAllSymbols = text.split(',');

    // List<String> popularTags = [];
    //
    // Map<String, int> counts =
    //     removeAllSymbols.fold({}, (map, removeAllSymbols) {
    //   map[removeAllSymbols] = (map[removeAllSymbols] ?? 0) + 1;
    //   return map;
    // });
    // var mapEntries = counts.entries.toList()
    //   ..sort((a, b) => a.value.compareTo(b.value));
    //
    // counts
    //   ..clear()
    //   ..addEntries(mapEntries);
    //
    // List newList = counts.keys.toList();
    // print(newList);
    //
    // for (int i = newList.length; i < newList.length; i++) {
    //   popularTags.add(newList[i].toString());
    // }
    // print(popularTags);

    database.doc().set(
      <String, dynamic>{
        "information": text,
        "product": productController.text.trim(),
        "tags": removeAllSymbols,
        "uid": user?.uid,
      },
    );

    Navigator.pop(context);
  }
}
