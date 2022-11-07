import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateProductViewModel extends ChangeNotifier {
  final informationController = TextEditingController();
  final productController = TextEditingController();
  final database = FirebaseFirestore.instance.collection('products');

  Future<void> createProduct(BuildContext context) async {
    String text = informationController.text.trim();
    List<String> result = text.split(',');

    List<String> popularTags = [];

    var counts = result.fold<Map<String, int>>({}, (map, result) {
      map[result] = (map[result] ?? 0) + 1;
      return map;
    });
    var mapEntries = counts.entries.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    counts
      ..clear()
      ..addEntries(mapEntries);

    List newList = counts.keys.toList();

    for (int i = (newList.length / 2).round(); i < newList.length; i++){
      popularTags.add(newList[i].toString());
    }

    database.doc().set(
      <String, dynamic>{
        "information": informationController.text.trim(),
        "product": productController.text.trim(),
        "tags": popularTags,
      },
    );

    Navigator.pop(context);
  }
}
