import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:tageneration/ui/screens/product_list/product_list_model.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ProductListViewModel>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 126,
          flexibleSpace: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(48.0),
                      child: Image.network(
                        'https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg',
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome Back',
                          style: GoogleFonts.inter(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                        Text(
                          'Dwayne Johnson',
                          style: GoogleFonts.inter(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xFFFFFFFF),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () => model.createProduct(context),
                      borderRadius: BorderRadius.circular(48),
                      child: Container(
                        width: 48,
                        alignment: Alignment.center,
                        height: 48,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFF494949),
                          ),
                          borderRadius: BorderRadius.circular(48.0),
                        ),
                        child: const Icon(
                          CupertinoIcons.add,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorRadius: Radius.circular(2),
                  cursorColor: Color(0xFFA0A7BA),
                  style: TextStyle(
                    color: Color(0xFFA0A7BA),
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search',
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream:
                FirebaseFirestore.instance.collection('products').snapshots(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final List<QueryDocumentSnapshot<Map<String, dynamic>>> docs =
                    snapshot.data!.docs;
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16.0),
                  physics: const BouncingScrollPhysics(),
                  itemCount: docs.length,
                  itemBuilder: (_, index) {
                    final doc = docs[index];
                    return _InformationBlockWidget(doc: doc);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 8.0);
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class _InformationBlockWidget extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> doc;

  const _InformationBlockWidget({
    Key? key,
    required this.doc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<dynamic> list = doc['tags'] as List<dynamic>;
    return Card(
      shadowColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      color: const Color(0xFFE5F1F6),
      child: ExpansionTile(
        collapsedIconColor: const Color(0xFFBCDAFC),
        iconColor: const Color(0xFFBCDAFC),
        expandedAlignment: Alignment.topLeft,
        childrenPadding:
        const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
        title: Text(
          doc['product'].toString(),
          style: const TextStyle(
            color: Color(0xFF333333),
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
            height: 24,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 24,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: const Color(0xB3FFFFFF),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: _TagWidget(
                    text: list[index].toString(),
                  ),
                );
              },
              separatorBuilder: (_, int index) => const SizedBox(
                width: 8,
              ),
              itemCount: list.length > 3 ? 3 : list.length,
            ),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              doc['information'] as String,
              style: const TextStyle(
                color: Color(0xFF000000),
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TagWidget extends StatelessWidget {
  final String text;

  const _TagWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF000000),
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
      ),
    );
  }
}
