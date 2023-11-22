import 'package:flutter/material.dart';
import 'package:helmetshope/models/product_category.dart';
import 'package:helmetshope/services/category_firebase_service.dart';

class AdminCategoryProvider extends ChangeNotifier{

  final CategoryFirebaseService categoryFirebaseService=CategoryFirebaseService();
 List<ProductCategory> _categoryList=[];
 List<ProductCategory> get categoryList=>_categoryList; 

void addCategory(ProductCategory newCategory)async{
  await categoryFirebaseService.addCategory(newCategory);
   //await fetchCategories();
  notifyListeners();

}
// method to get the list of cat from firebse databse
Future<List> fetchCategories()async{
  final _categoryList=await categoryFirebaseService.getCategories();
  notifyListeners();
  return _categoryList;
   
}


}