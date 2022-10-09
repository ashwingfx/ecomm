import 'package:flutter/material.dart';
class ProductPage extends StatefulWidget {
  //const ProductPage({Key? key}) : super(key: key);

  final  productId;
  ProductPage({required this.productId});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("${widget.productId}"),
        ),
      ),
    );
  }
}
