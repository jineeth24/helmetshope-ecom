
import 'package:flutter/material.dart';

import 'category_list_item.dart';

class CategoryListView extends StatelessWidget {
  List<String> categoryList = ["Helmets", "Jackets", "Gloves", "Boots"];
  //get the catlist

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) =>
            CategoryListItemWidget(categoryName: categoryList[index]),
      ),
    );
  }
}
