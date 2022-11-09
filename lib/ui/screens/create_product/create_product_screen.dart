import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tageneration/ui/screens/create_product/create_product_model.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<CreateProductViewModel>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: model.productController,
            decoration: const InputDecoration(
              hintText: 'Name',
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
          ),
          child: TextFormField(
            controller: model.informationController,
            expands: true,
            minLines: null,
            maxLines: null,
            decoration: InputDecoration(
              hintText: 'Information',
              filled: true,
              fillColor: Colors.transparent,
              iconColor: const Color(0xFFA0A7BA),
              hintStyle: GoogleFonts.inter(
                fontWeight: FontWeight.w300,
                fontSize: 18.0,
                color: const Color(0xFFA0A7BA),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
            ),
          ),
        ),
        bottomNavigationBar: ElevatedButton(
          onPressed: () => model.createProduct(context),
          child: Text('1'),
        ),
      ),
    );
  }
}
