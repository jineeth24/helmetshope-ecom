import 'package:flutter/material.dart';
import 'package:helmetshope/models/product_category.dart';
import 'package:helmetshope/services/category_firebase_service.dart';

class AdminCategoryProvider extends ChangeNotifier{
  ProductCategory? selectedCategoryId;

  final CategoryFirebaseService categoryFirebaseService=CategoryFirebaseService();
 List<ProductCategory> _categoryList=[];


 

void addCategory(ProductCategory newCategory)async{
  await categoryFirebaseService.addCategory(newCategory);
   //await fetchCategories();
  notifyListeners();

}

void fetchCategories()async{
  _categoryList.clear();
_categoryList=  await  categoryFirebaseService.getCategories();

}



List<ProductCategory> get categoryList=>_categoryList; 

//dropdown
// void initialCategory(){
//   selectedCategoryId=categoryList.first.name;
// }

 // CategoryDropdownProvider(this.categoryList);

  void setSelectedCategory( selectedId) {
    selectedCategoryId = selectedId ;
    notifyListeners();
  }


}