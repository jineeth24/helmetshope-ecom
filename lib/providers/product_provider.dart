import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helmetshope/services/product_firebase_service.dart';

import '../models/product_category.dart';
import '../models/product_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProductProvider with ChangeNotifier{

 firebase_storage.FirebaseStorage storage=firebase_storage.FirebaseStorage.instance;
  final ProductFirebaseService productFirebaseService=ProductFirebaseService();
 List<Product> _productsList=[];
 List<Product> get productList=>_productsList; 
 List<String> _images = [];
 File? firstimage;
 String? imagename;
 String? newUrl;

  // Method to pick images from the gallery
  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickMultiImage();
    XFile  imagefile =pickedImages[0];
    if(imagefile!=null){
      firstimage=File(imagefile.path);
      imagename=imagefile.name;
    }

    _images = pickedImages.map((image) => image.path).toList();
    notifyListeners();
  }
  List<String> get images => _images;
  // XFile? get firstimage=>_firstimage;

  //  void setImages(List<String> images) {
  //   _images = images;
  //   notifyListeners();
  // }
  Future uploadToStorage()async{
    firebase_storage.Reference ref=firebase_storage.FirebaseStorage.instance.ref('/imagefolder/$imagename}');
     firebase_storage.UploadTask uploadTask=ref.putFile(firstimage!.absolute);
     await Future.value(uploadTask);
      newUrl=await ref.getDownloadURL();
  }
 // String? get newUrl=>_newUrl;


List<ProductCategory> _categories = [];
//setcategories for using in addproductscreen,for dropdown
 void setCategories(List<ProductCategory>categories) {
    _categories = categories;
    notifyListeners();
//print("from prodcutprovider categories");
    //print(categories);
  
  }
//product
  void addProduct(Product newProduct)async{
  await uploadToStorage();
  await productFirebaseService.addProduct(newProduct,newUrl!);
   //await fetchCategories();
  notifyListeners();

}

//wehave a productlist,now using firebaseservice fetchproducts get productlist

  Future<void> fetchProducts() async {
    // Call fetchProducts from ProductService
    List<Product> fetchedProducts = await productFirebaseService.fetchProducts();

    _productsList.addAll(fetchedProducts);
    //print(_productsList[1].productName);
    notifyListeners();
  }

//  void refreshProduct(){
//   productFirebaseService.refreshProductList();
//  }

}