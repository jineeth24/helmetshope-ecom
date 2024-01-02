import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:helmetshope/widgets/product_card.dart';

import 'category_list_item.dart';
//listview to show most popular and recommended items
//recieve category ids and get products list with same cat
class ProductListView extends StatelessWidget {
  // List<String> productlist = [
  //   "https://vegaauto.com/wp-content/uploads/2023/06/Black-Yellow-2.jpg",
  //   "https://vegaauto.com/wp-content/uploads/2023/06/Bolt-Southpaw-white-grey-2.jpg",
  //   "https://vegaauto.com/wp-content/uploads/2022/12/DULL-BLACK-RED-2.jpg"
  // ];
  final DatabaseReference productRef =
      FirebaseDatabase.instance.ref("Products");

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder(
       stream: productRef.onValue,//select categoryid here
     //  stream: productRef.orderByChild("helmets").equalTo("helmets").onValue,
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error :${snapshot.error}");
          } else if (!snapshot.hasData ||
              snapshot.data!.snapshot.value == null) {
            return Text("no data available");
          } else {
            try {
              Map<dynamic, dynamic> productMap=
                  snapshot.data!.snapshot.value as dynamic;
                 //productMap.forEach(key,value){
                 //if(value[categoryId]==currentCategory){
                 //productList.add(product.fromMap(value))}
                 //}

              List<dynamic> productList = productMap.values.toList();
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    var data = productList[index];
                    return ProductCard(
                        index:index,
                     // productId: data['productId'],
                        productName: data['productName'],
                        price: "${data['retailPrice']}",
                        images: data['images']);
                  });
            } catch (e) {
              return Center(
                child: Text('Error:$e'),
              );
            }
          }
        },
      ),
    );
  }
}
