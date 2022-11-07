import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tageneration/ui/screens/create_product/create_product_model.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<CreateProductViewModel>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: model.productController,
            ),
            TextField(
              controller: model.informationController,
            ),
            ElevatedButton(
              onPressed: () => model.createProduct(context),
              child: Text('Create'),
            )
          ],
        ),
      ),
    );
  }
}
