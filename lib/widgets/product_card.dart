
import 'package:flutter/material.dart';

import '../screens/product_screen.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  ProductCard({required this.productName});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductScreen())),
      child: Container(
        // height: 200,
        // width: 180,
        //padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color.fromARGB(255, 230, 227, 227),
        ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(4),
              height: 150,
              width: MediaQuery.of(context).size.width / 2.5,
              child: Image.network(
                productName,
                fit: BoxFit.cover,
              ),
            ),
             Positioned(
              bottom: 0,
              left: 5,
              child: Container(
                //color: Colors.amber,
                margin:const EdgeInsets.all(5),
                child:const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("helmets name"), Text("\$price")],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
