  class ProductCategory {
  final String? id;
  final String name;
  ProductCategory({ this.id, required this.name});
  
   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
   factory ProductCategory.fromMap(String id, Map<String, dynamic> data) {
    return ProductCategory(
      id: data['id'],
      name: data['name'],
    );
  }
}
