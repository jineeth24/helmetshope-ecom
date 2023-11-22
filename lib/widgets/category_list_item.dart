
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../screens/catelogue_screen.dart';
//this is the category list item for the  horizontal scroll bar



class CategoryListItemWidget extends StatelessWidget {
  final String categoryName;
  CategoryListItemWidget({required this.categoryName});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CatelogueScreen(categoryName: categoryName,))),
      child: Container(
        height: 80,
        width: 100,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Color.fromARGB(255, 223, 216, 216),
        ),
        child:  Center(
          child: Text(categoryName),
        ),
      ),
    );
  }
}
