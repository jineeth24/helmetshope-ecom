
import 'package:flutter/material.dart';

import '../widgets/custom_appbar_widget.dart';
import '../widgets/product_card.dart';

class CatelogueScreen extends StatelessWidget {
  final String categoryName;
  const CatelogueScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: categoryName,
      ),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: 10,
          itemBuilder: (context,int index){
            return ProductCard(productName: "productName");
          },
        ),
      ),
    );
  }
}
