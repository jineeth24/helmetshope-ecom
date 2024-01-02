import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:helmetshope/services/product_firebase_service.dart';

import '../models/product_category.dart';
import '../models/product_model.dart';
import '../widgets/custom_appbar_widget.dart';
import '../widgets/product_card.dart';

//screen to show products of diff categories
//get categories id,filter products with id, and show them
//get productlist using iid
final DatabaseReference productRef = FirebaseDatabase.instance.ref("Products");

final ProductFirebaseService productFirebaseService = ProductFirebaseService();

class CatelogueScreen extends StatelessWidget {
  final ProductCategory category;
  const CatelogueScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
   // productFirebaseService.getProducts();
    List<Product> productList=[];
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: category.name,
      ),
      body: SafeArea(
        child: StreamBuilder(
            stream: productRef.onValue,
            builder: (context, snapshot) {
              Map<dynamic, dynamic> catmap =
                  snapshot.data!.snapshot.value as dynamic;
              catmap.forEach(
                (key, value) {
                 if(value["categoryId"]==category.id){
                 productList=catmap.values.map((e) => Product.fromMap(e)).toList();
                 }
                  
                },
              );
              print(productList);
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: productList.length,
                itemBuilder: (context, int index) {
                  var data=productList[index];
                  return ProductCard(
                   // productId: data.productId,
                    productName: data.productName,
                    price: "${data.purchasePrice}",
                    images: data.images!,
                  );
                },
              );
            }),
      ),
    );
  }
}
