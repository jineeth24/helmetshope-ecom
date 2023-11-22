import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:helmetshope/core/constants.dart';
import 'package:helmetshope/providers/category_dropdown_provider.dart';
import 'package:helmetshope/providers/product_provider.dart';
import 'package:helmetshope/widgets/custom_textform_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../widgets/custom_appbar_widget.dart';

List<String> categoryList = ["helmets", "jackets", "gloves", "pads"];

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
  //String dropDownValue = categoryList[0];

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryDropdownProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
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
                CategoryDropdown(),
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
                          style:const TextStyle(
                              color: Color.fromARGB(255, 214, 45, 33)),
                        ),
                    ],
                  ),
                TextButton(
                    onPressed: () {
                      productProvider.uploadToStorage();
                      Product newProduct = Product(
                          productName: productNameController.text,
                          categoryId: categoryProvider.dropDownValue.toString(),
                          description: descriptionController.text.toString(),
                          purchasePrice:
                              double.parse(purchasePriceController.text),
                          retailPrice: double.parse(retailPriceController.text),
                          stock: int.parse(stockController.text),
                          );

                      // print(newProduct.categoryId);
                      productProvider.addProduct(newProduct);
                    },
                    child: Text("Save")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget CategoryDropdown() {
  //   final dropdownvalueProvider =
  //       Provider.of<CategoryDropdownProvider>(context);
  //   return DropdownButton(
  //       hint: Text("Select Category"),
  //       value: dropdownvalueProvider.dropDownValue,
  //       items: categoryList.map<DropdownMenuItem<String>>((String category) {
  //         return DropdownMenuItem(value: category, child: Text(category));
  //       }).toList(),
  //       onChanged: (String? value) {
  //         //user provider method to set value
  //         dropdownvalueProvider.setDropDownvalue(value!);
  //       });
  // }
}

class CategoryDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 0,
      child: Consumer<CategoryDropdownProvider>(
        builder: (context, dropdownvalueProvider, child) {
          return DropdownButtonFormField(
            // isExpanded: true,
            // hint: Text("Select Category"),
            decoration: InputDecoration(
              hintText: "Category",
              labelText: " Select catgory",
            ),
            value: dropdownvalueProvider.dropDownValue,
            items: dropdownvalueProvider.categoryList
                .map<DropdownMenuItem<String>>((String category) {
              return DropdownMenuItem(value: category, child: Text(category));
            }).toList(),
            onChanged: (String? value) {
              dropdownvalueProvider.setDropDownValue(value!);
            },
          );
        },
      ),
    );
  }
}
