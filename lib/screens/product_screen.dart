import 'package:flutter/material.dart';
import 'package:helmetshope/screens/cart_screen.dart';
import 'package:provider/provider.dart';

import '../core/constants.dart';
import '../models/product_model.dart';
import '../providers/product_provider.dart';
import '../widgets/custom_appbar_widget.dart';

class ProductScreen extends StatelessWidget {
  final index;
  // final String productId;
  ProductScreen({this.index});
  //  @override
  // Widget build(BuildContext context) {
  //   var productProvider = Provider.of<ProductProvider>(context);

  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Product Screen'),
  //     ),
  //     body: FutureBuilder(
  //       future: productProvider.fetchProducts(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return CircularProgressIndicator();
  //         } else if (snapshot.hasError) {
  //           return Text('Error: ${snapshot.error}');
  //         } else {
  //           return ListView.builder(
  //             itemCount: productProvider.productList.length,
  //             itemBuilder: (context, index) {
  //               Product product = productProvider.productList[index];
  //               return ListTile(
  //                 title: Text(product.productName),
  //                // subtitle: Text('Price: \$${product.retailPrice.toStringAsFixed(2)}'),
  //               );
  //             },
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }
// }

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    productProvider.fetchProducts();
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Productname"),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: 350,
              child: Image(
                image:
                    NetworkImage("${productProvider.productList[index].images}"
                        //" ${productProvider.productList[1].images}",

                        ),
                fit: BoxFit.contain,
              ),

              // color: Colors.red,
            ),
            kheight30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productProvider.productList[index].productName,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  "\$${productProvider.productList[index].retailPrice}",
                  style: titleStyle,
                ),
              ],
            ),
            Text(
              productProvider.productList[index].productName,
              style: titleStyle,
            ),
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 221, 211, 211),
              ),
              child: const Text(
                "Description",
                style: titleStyle,
              ),
            ),
            kheight15,
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 221, 211, 211),
              ),
              //color: const Color.fromARGB(255, 218, 213, 213),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    child: const Text(
                      "Add to Wishlist",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      //current userid,productid,quantity,
                      //add to cart
                    },
                  ),
                  TextButton(
                    child:const Text(
                      "Add to Cart",
                      style: titleStyle,
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const CartScreen()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
