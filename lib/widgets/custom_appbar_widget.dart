import 'package:flutter/material.dart';
import 'package:helmetshope/screens/admin_home_screen.dart';

class CustomAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title; 
  
  CustomAppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {
             Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AdminHomeScreen(),
                  ),
                );
          },
          icon: Icon(Icons.admin_panel_settings),
        ),
      ],
    );
  }
}