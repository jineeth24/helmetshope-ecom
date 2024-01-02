import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:helmetshope/core/constants.dart';
import 'package:helmetshope/models/product_category.dart';
import 'package:helmetshope/providers/admin_category_provider.dart';
import 'package:helmetshope/providers/category_dropdown_provider.dart';
import 'package:helmetshope/providers/product_provider.dart';
import 'package:helmetshope/screens/admin_product_home_screen.dart';
import 'package:helmetshope/widgets/custom_textform_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../providers/admin_category_provider.dart';
import '../widgets/custom_appbar_widget.dart';

//List<String> categoryList = ["helmets", "jackets", "gloves", "pads"];

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProdctScreenState();
}

class _AddProdctScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController purchasePriceController = TextEditingController();
  final TextEditingController retailPriceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final adminCategoryProvider = Provider.of<AdminCategoryProvider>(context);
    // final categorydropdownProvider =
    //     Provider.of<CategoryDropdownProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final categoryList = adminCategoryProvider.categoryList;

   

    return Scaffold(
      appBar: AppBar(
        title: Text("AddProduct"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                CustomTextFormWidget(
                    formController: productNameController,
                    hintText: "ProductName"),
                kheight5,
                CustomTextFormWidget(
                  formController: descriptionController,
                  hintText: "Description",
                  keyboardType: TextInputType.multiline,
                ),
                kheight5,
                CustomTextFormWidget(
                    formController: purchasePriceController,
                    keyboardType: TextInputType.number,
                    hintText: "Purchase Price"),
                kheight5,
                CustomTextFormWidget(
                    formController: retailPriceController,
                    keyboardType: TextInputType.number,
                    hintText: "Retail Price"),
                kheight5,
                CustomTextFormWidget(
                    formController: stockController, hintText: "Stock"),
                kheight5,
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 5), // Set the desired horizontal padding
                  child: Container(
                    width: MediaQuery.of(context)
                        .size
                        .width, // Set the desired width
                    child: CategoryDropdown(categoryList),
                  ),
                ),

                //give catlist as arguments
                ElevatedButton(
                  onPressed: () async {
                    //_pickImage();

                    await productProvider.pickImages();
                  },
                  child: Text('Pick Images'),
                ),
                // Display the picked images
                if (productProvider.images.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Picked Images:'),
                      SizedBox(height: 8),
                      // Display the picked image paths
                      for (var imagePath in productProvider.images)
                        Text(
                          imagePath,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 214, 45, 33)),
                        ),
                    ],
                  ),
                TextButton(
                    onPressed: () {
                      productProvider.uploadToStorage();
                      // final productUrl = productProvider.newUrl;
                      Product newProduct = Product(
                        productName: productNameController.text,
                        categoryId: adminCategoryProvider.selectedCategoryId!.id
                            .toString(),
                        //give the categoryid,not name
                        description: descriptionController.text.toString(),
                        purchasePrice: double.parse(purchasePriceController.text),
                        retailPrice: double.parse(retailPriceController.text),
                        stock: int.parse(stockController.text),
                      );
                      

                      productProvider.addProduct(newProduct);
                      Navigator.of(context).pop();
                    },
                    child: Text("Save")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CategoryDropdown(List<ProductCategory> categories) {
    return Consumer<AdminCategoryProvider>(
      builder: (context, adminCategoryProvider, child) {
        var selectedItemId = adminCategoryProvider.selectedCategoryId;

        return DropdownButton(
          value: selectedItemId,
          items: categories.map((ProductCategory category) {
            return DropdownMenuItem(
              value: category,
              child: Text(category.name),
            );
          }).toList(),
          onChanged: (value) {
            adminCategoryProvider.setSelectedCategory(value!);
          
          },
        );
      },
    );
  }
}
