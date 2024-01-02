import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:helmetshope/core/constants.dart';
import 'package:helmetshope/models/product_category.dart';
import 'package:helmetshope/screens/add_product_screen.dart';
import 'package:helmetshope/screens/catelogue_screen.dart';
import 'package:helmetshope/services/category_firebase_service.dart';
import 'package:helmetshope/widgets/category_list_view.dart';
import 'package:helmetshope/widgets/product_card.dart';
import 'package:helmetshope/widgets/product_listview.dart';

import '../widgets/custom_appbar_widget.dart';

//get list of categories, build listviews for each category by sending the catid to productlistview builder
//singlechildscrollview
//a listview seperated builder
//itemcount=catlist.length
// listview returns productlistview

class AdminProductHomeScreen extends StatelessWidget {
  AdminProductHomeScreen({super.key});
  final CategoryFirebaseService firebaseService = CategoryFirebaseService();
  final DatabaseReference categoryRef =
      FirebaseDatabase.instance.ref("ProductCategory");

  final DatabaseReference productRef =
      FirebaseDatabase.instance.ref("Products");

  @override
  Widget build(BuildContext context) {
    firebaseService.getCategories();
    final length = firebaseService.categoryList.length;
    print(length);
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Products"),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        // child: CategoryListView(),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: categoryRef.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData ||
                      snapshot.data!.snapshot.value == null) {
                    return const Center(
                      child: Text('No data available'),
                    );
                  } else {
                    try {
                      Map<dynamic, dynamic> catmap =
                          snapshot.data!.snapshot.value as dynamic;

                      List<ProductCategory> catList = catmap.values
                          .map((e) => ProductCategory.fromMap(e))
                          .toList();

                      return ListView.builder(
                        itemCount: catList.length,
                        itemBuilder: (context, index) {
                          var category = catList[index];
                          return AdminCatgoryListTile(
                            category: category,
                          );
                          // return ListTile(
                          //   title: Text(catlist[index]['name']),
                          //   subtitle: Text(catlist[index]['id']),
                          // );
                        },
                      );
                    } catch (e) {
                      return Center(
                        child: Text('issue: $e'),
                      );
                    }
                  }
                },
              ),
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
        ),
      )),
    );
  }
}

class AdminCatgoryListTile extends StatelessWidget {
  final ProductCategory category;
  const AdminCatgoryListTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          child: Center(
              child: Text(
            category.name,
            style: titleStyle,
          )),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CatelogueScreen(category: category),
            ),
          );
        },
      ),
    );
  }
}
