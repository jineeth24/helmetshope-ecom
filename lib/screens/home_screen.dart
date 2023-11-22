
import 'package:flutter/material.dart';
import 'package:helmetshope/widgets/category_list_view.dart';
import 'package:helmetshope/widgets/custom_appbar_widget.dart';
import 'package:helmetshope/widgets/product_listview.dart';

import '../core/constants.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: "SafeHeads",), //appbar
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //categorylistscrollview
              const Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              kheight15,
              CategoryListView(),
              kheight15,
              //carosal showing banners,offers
              //recommended scrollview
              const Text(
                "Recommended",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              kheight15,
              ProductListView(),
              kheight15,
              const Text(
                "Popular",
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              kheight15,
              //popularscrollview
             // ProductListView(),
              ProductListView(),
              
              //bottomnavbar
            ],
          ),
        ),
      )),
    );
  }
}


