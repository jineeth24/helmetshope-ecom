import 'package:firebase_database/firebase_database.dart';
import 'package:helmetshope/models/product_category.dart';

class CategoryFirebaseService {
  final DatabaseReference categoryRef =
      FirebaseDatabase.instance.ref("ProductCategory");

      //list of categories
       final List<ProductCategory> categoryList=[];

  Future<void> addCategory(ProductCategory category) async {
    try {
      //generate a unique id for the category
      String categoryId = categoryRef.push().key ?? '';
      await categoryRef.child(category.name).set({
        "id":categoryId,
        "name":category.name
      });
      // getCategories();
      getCategories();
    } catch (e) {
      print('Error adding category: $e');
    }
  }

  //  getCategories()async{
  //    final event = await categoryRef.child('ProductCategory').once();
  //    print(event.snapshot.value.toString());
  //    Map<dynamic, dynamic>? categoriesMap = event.snapshot.value as dynamic;
  //    //print(categoriesMap);
  //   //  print(categoriesMap);
  //   // final event = await categoryRef.once();
  //   // final cat=event.snapshot.value;
  //   // print(event.snapshot.value);
  //   //print(categories);

  //  }
  //  Stream<DatabaseEvent>? getcat(){
  //   return categoryRef.onValue;
  //  }

  // Future<List<ProductCategory>> getCategories() async {
  //   try {
  //     final event = await categoryRef.once();
  //     print(event.snapshot.value.toString());

  //     DatabaseEvent databaseEvent = await categoryRef.once();
  //     List<ProductCategory> categories = [];
  //     if (databaseEvent.snapshot.value != null) {
  //     //  print(databaseEvent.snapshot.value);
  //       Map<dynamic, dynamic> map =databaseEvent.snapshot.value as dynamic;
  //       map.forEach((key, value) {
  //         categories.add(ProductCategory.fromMap(key, value));
  //       });
  //     }
  //     print(categories);
  //     return categories;
  //   } catch (e) {
  //     print('Error getting categories: $e');
  //     return [];
  //   }
  // }

  Future<List<ProductCategory>> getCategories() async {
   
    final event = await categoryRef.once(DatabaseEventType.value);
    final Map<dynamic, dynamic> catmap =
        event.snapshot.value as Map<dynamic, dynamic>;
    //print(catmap);
    catmap.forEach(
      (key, value) {
        final category = ProductCategory(id: value["id"], name: value["name"]);
        categoryList.add(category);
      },
    );
   
    return categoryList;
   
  }
}
