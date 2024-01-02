import 'package:firebase_database/firebase_database.dart';

import '../models/product_model.dart';

class ProductFirebaseService {
  final DatabaseReference productRef =
      FirebaseDatabase.instance.ref("Products");

  // List<Product> productList = [];

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
   // print(newProduct.purchasePrice);
   // getProducts();
  }

  // Future<List<Product>> getProducts() async {
  //   final event = await productRef.once(DatabaseEventType.value);
  //   final Map<dynamic, dynamic> productMap =
  //       event.snapshot.value as Map<dynamic, dynamic>;
  //   print(productMap);
  //   productMap.forEach(
  //     (key, value) {
  //       final product = Product(
  //           productName: value["productName"],
  //           categoryId: value["categoryId"],
  //           description: value["description"],
  //           purchasePrice: value["purchasePrice"].toDouble(),
  //           retailPrice: value["retailPrice"].toDouble(),
  //           stock: value["stock"]);
  //           print(product.retailPrice);
  //       productList.add(product);
  //     },
  //   );
    

  //   return productList;
  // }
  // void refreshProductList()async{
  //   productList=await getProducts();
  // }
Future<List<Product>> fetchProducts() async {
  //DatabaseReference reference = FirebaseDatabase.instance.reference().child('products');
  DatabaseEvent event= await productRef.once();
  // DataSnapshot snapshot = await productRef.once();

  List<Product> products = [];
//print(event.snapshot.value);
  if (event.snapshot.value != null) {
   
  Map data= event.snapshot.value as dynamic;
  
//print('hi');
    data.forEach((key, value) {
      Product product = Product.fromMap(value);
      products.add(product);
    });
  }
//print(products);
  return products;
}






}
