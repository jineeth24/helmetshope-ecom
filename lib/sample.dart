// // void main() {
// //   runApp(
// //     MultiProvider(
// //       providers: [
// //         ChangeNotifierProvider<CategoryProvider>(
// //           create: (context) => CategoryProvider(),
// //         ),
// //         ProxyProvider<CategoryProvider, ProductProvider>(
// //           update: (context, categoryProvider, productProvider) {
// //             productProvider ??= ProductProvider();
// //             productProvider.fetchProductsFromDatabase(); // Fetch products
// //             productProvider.setCategories(categoryProvider.categoryList);
// //             return productProvider;
// //           },
// //         ),
// //       ],
// //       child: MyApp(),
// //     ),
// //   );
// // }

// class CategoryProvider extends ChangeNotifier {
//   List<String> _categoryList = [];

//   List<String> get categoryList => _categoryList;

//   Future<void> fetchCategoriesFromDatabase() async {
//     // Fetch categories and update _categoryList
//     // ...
//     notifyListeners();
//   }
// }

// class ProductProvider extends ChangeNotifier {
//   List<Product> _products = [];
//   List<String> _categories = [];

//   List<Product> get products => _products;
//   List<String> get categories => _categories;

//   Future<void> fetchProductsFromDatabase() async {
//     // Fetch products and update _products
//     // ...
//     notifyListeners();


  // void setCategories(List<String> categories) {
  //   _categories = categories;
  //   notifyListeners();
  
  // }

//   }
// }
