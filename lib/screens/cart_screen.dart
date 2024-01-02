import 'package:flutter/material.dart';
import 'package:helmetshope/widgets/custom_appbar_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Cart'),
      body: SafeArea(child:Column(
        children: [

        ],
      ) ),
    );
  }
}