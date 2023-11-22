import 'package:firebase_database/firebase_database.dart';

import '../models/product_model.dart';

class ProductFirebaseService {
  final DatabaseReference productRef =
      FirebaseDatabase.instance.ref("Products");

  final List<Product> productList = [];

  Future<void> addProduct(Product newProduct, String imageUrl) async {
    String productId = productRef.push().key ?? '';
    await productRef.child(productId).set({
      "id": productId,
      "productName": newProduct.productName,
      "categoryId": newProduct.categoryId,
      "description": newProduct.description,
      "purchasePrice": newProduct.purchasePrice,
      "retailPrice": newProduct.retailPrice,
      "stock": newProduct.stock,
      "images": imageUrl
    });
    getProducts();
  }

  Future<List<Product>> getProducts() async {
    final event = await productRef.once(DatabaseEventType.value);
    final Map<dynamic, dynamic> productMap =
        event.snapshot.value as Map<dynamic, dynamic>;
    print(productMap);
    productMap.forEach(
      (key, value) {
        final product = Product(
            productName: value["productName"],
            categoryId: value["categoryId"],
            description: value["description"],
            purchasePrice: value["purchasePrice"],
            retailPrice: value["retailPrice"],
            stock: value["stock"]);
        productList.add(product);
      },
    );

    return productList;
  }
}
