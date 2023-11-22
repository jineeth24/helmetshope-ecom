import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:helmetshope/screens/add_product_screen.dart';
import 'package:helmetshope/services/category_firebase_service.dart';

import '../widgets/custom_appbar_widget.dart';

class AdminProductScreen extends StatelessWidget {
   AdminProductScreen({super.key});
  final CategoryFirebaseService firebaseService=CategoryFirebaseService();
  
  final DatabaseReference productRef=FirebaseDatabase.instance.ref("Products");

  @override
  Widget build(BuildContext context) {
    firebaseService.getCategories();
     final length=firebaseService.categoryList.length;
     print(length);
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Products"),
      body: SafeArea(
          child: Column(
        children: [
        //  Expanded(
        //         child: StreamBuilder(
        //           stream:productRef.onValue,
        //           builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
        //             Map<dynamic,dynamic> map= snapshot.data!.snapshot.value  as dynamic;
        //             List<dynamic> catlist=map.values.toList();

        //           return ListView.builder(
        //             itemCount: snapshot.data!.snapshot.children.length,
        //             itemBuilder: (context, index) {
        //             return ListTile(
        //               //tileColor: Colors.grey,
        //               title: Text(catlist[index]['name']),
        //               subtitle: Text(catlist[index]['id']),
        //             );
        //           });
        //         }),
        //       ),
          Expanded(
            child: ListView.builder(
            // itemCount: firebaseService.productList.length,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ListTile(
                    title: Text("Product"),
                  );
                }),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AddProductScreen(),
                        ),
                      );
            },
            child: Text("AddProduct"),
          ),
        ],
      )),
    );
  }
}
