
import 'package:flutter/material.dart';

import '../core/constants.dart';
import '../widgets/custom_appbar_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              child:const Image(
                  image: NetworkImage(
                "https://vegaauto.com/wp-content/uploads/2023/06/Bolt-Southpaw-white-grey-2.jpg",
              ),
              fit: BoxFit.contain,
              ),

              // color: Colors.red,
            ),
            kheight30,
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Item Name",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  "\$ 200",
                  style: titleStyle,
                ),
              ],
            ),
            const Text(
              "Model name",
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Add to Wishlist",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Add to Cart",
                    style: titleStyle,
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
