import 'package:flutter/material.dart';
import 'package:helmetshope/core/constants.dart';
import 'package:helmetshope/screens/admin_category_screen.dart';
import 'package:helmetshope/screens/admin_product_screen.dart';
import 'package:helmetshope/screens/catelogue_screen.dart';
import 'package:helmetshope/screens/home_screen.dart';
import 'package:helmetshope/screens/login_screen.dart';
import 'package:helmetshope/widgets/category_list_item.dart';

class AdminHomeScreen extends StatelessWidget {
  AdminHomeScreen({super.key});

  final adminfeaturelist = ["categories", "products", "users", "orders"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
                  custombutton(
                  name: "Categories",
                  context: context,
                  screen: AdminCategoryScreen(),),
                  kheight15,
                  custombutton(
                  name: "Products",
                  context: context,
                  screen: AdminProductScreen(),),
                  kheight15,
                   custombutton(
                  name: "Orders",
                  context: context,
                  screen: AdminCategoryScreen(),),
                  kheight15,
                   custombutton(
                  name: "Users",
                  context: context,
                  screen: LoginScreen(),),
                 
            ],
          ),
        ),
      ),
    );
  }

  Widget custombutton({required String name, required BuildContext context,required Widget screen}) {
    return Container(
       height: 60,
       width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color:Color.fromARGB(218, 199, 193, 193)
      ),
      child: TextButton(
        onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => screen,
                        ),
                      );
                    },
        child: Text(
          name,
          style:titleStyle,
        ),
      ),
    );
  }
}
