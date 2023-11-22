import 'package:flutter/material.dart';
import 'package:helmetshope/providers/admin_category_provider.dart';
import 'package:provider/provider.dart';

List<String> _categoryList = ["helmets", "jackets", "gloves", "pads"];

class CategoryDropdownProvider with ChangeNotifier {
//get a list of categories
 // List<String> categoryList = ["helmets", "jackets", "gloves", "pads"];
  List<String> get categoryList => _categoryList;

   String _dropDownValue= _categoryList[0];

  String get dropDownValue => _dropDownValue;

  void setDropDownValue(String value) {
    _dropDownValue = value;
    notifyListeners();
  }
}
