import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:helmetshope/models/product_category.dart';
import 'package:helmetshope/providers/admin_category_provider.dart';
import 'package:helmetshope/services/category_firebase_service.dart';
import 'package:provider/provider.dart';

class AdminCategoryScreen extends StatelessWidget {
  const AdminCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
   

    final categoryProvider = Provider.of<AdminCategoryProvider>(context);
    final DatabaseReference categoryRef =
        FirebaseDatabase.instance.ref("ProductCategory");
    

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
             Expanded(
                child: StreamBuilder(
                  stream:categoryRef.onValue,
                  builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                    Map<dynamic,dynamic> map= snapshot.data!.snapshot.value  as dynamic;
                    List<dynamic> catlist=map.values.toList();

                  return ListView.builder(
                    itemCount: snapshot.data!.snapshot.children.length,
                    itemBuilder: (context, index) {
                    return ListTile(
                      //tileColor: Colors.grey,
                      title: Text(catlist[index]['name']),
                      subtitle: Text(catlist[index]['id']),
                    );
                  });
                }),
              ),
              // Expanded(
              //   child: ListView.builder(
                 
              //     itemCount:catList.length ,
              //     itemBuilder: ((context, index) => const ListTile(
              //           title: Text("hello"),
              //         )),
              //   ),
              // ),
              

              Container(
                child: TextButton(
                  child: Text("Add Category"),
                  onPressed: () {
                    openDialog(context, categoryProvider);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future openDialog(BuildContext ctx, AdminCategoryProvider provider) {
  final categoryController=TextEditingController();
  return showDialog(
    context: ctx,
    builder: (context) {
      return AlertDialog(
        title: Text("Create new Category"),
        content: TextField(
          controller: categoryController,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              final ProductCategory newCategory =
                  ProductCategory( name: categoryController.text);
                  print(newCategory.name);
              provider.addCategory(newCategory);

              //create a addcatgory function in firebase service class as admin crud class, with
              // add catgory function,add product etc
              // String categoryId = dbref.push().key ?? '';

              // dbref.child(categoryId).set(newcat.toMap());
            },
            child: Text("Submit"),
          ),
        ],
      );
    },
  );
}
