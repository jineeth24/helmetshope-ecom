import 'package:image_picker/image_picker.dart';
// List<String> images ;
class Product {
  final String? productId;
  final String productName;
  final String categoryId;
  final String description;
  final double purchasePrice;
  final double retailPrice;
  final int stock;
 String? images;

  Product({
    this.productId,
    required this.productName,
    required this.categoryId,
    required this.description,
    required this.purchasePrice,
    required this.retailPrice,
    required this.stock,
     this.images,
  });
  
    factory Product.fromMap(Map<dynamic, dynamic> map) {
    return Product(
      productId: map['productId'],
      productName: map['productName'],
      categoryId: map['categoryId'],
      description: map['description'],
      purchasePrice: map['purchasePrice'].toDouble(),
      retailPrice: map['retailPrice'].toDouble(),
      stock: map['stock'],
      images: map['images'],
    );
  }

  // Add a list to store picked image URIs
  // Method to pick images from the gallery
  // Future<void> pickImages() async {
  //   final picker = ImagePicker();
  //   final pickedImages = await picker.pickMultiImage();

  //   images = pickedImages.map((image) => image.path).toList();
  // }
}
