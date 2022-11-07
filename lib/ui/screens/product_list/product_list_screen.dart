import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tageneration/ui/screens/product_list/product_list_model.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ProductListViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
                snapshot.data!.docs;
            return ListView.separated(
              padding: const EdgeInsets.all(8.0),
              physics: const BouncingScrollPhysics(),
              itemCount: docs.length,
              itemBuilder: (_, index) {
                final doc = docs[index];
                return ListTile(
                  title: Text(
                    doc['product'].toString(),
                  ),
                  subtitle: Text(
                    doc['tags'].toString(),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 8.0);
              },
            );
          }
        },
      ),
      floatingActionButton: const _CreateProductWidget(),
    );
  }
}

class _CreateProductWidget extends StatelessWidget {
  const _CreateProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ProductListViewModel>();
    return FloatingActionButton.extended(
      onPressed: () => model.createProduct(context),
      label: Row(
        children: const [
          Icon(
            CupertinoIcons.add,
            color: Color(0xFFFFFFFF),
          ),
          SizedBox(width: 8.0),
          Text('Create'),
        ],
      ),
    );
  }
}
