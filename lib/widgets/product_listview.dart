
import 'package:flutter/material.dart';
import 'package:helmetshope/widgets/product_card.dart';

import 'category_list_item.dart';
//listview to show most popular and recommended items

class ProductListView extends StatelessWidget{
  List <String>productlist=
  ["https://vegaauto.com/wp-content/uploads/2023/06/Black-Yellow-2.jpg",
  "https://vegaauto.com/wp-content/uploads/2023/06/Bolt-Southpaw-white-grey-2.jpg",
  "https://vegaauto.com/wp-content/uploads/2022/12/DULL-BLACK-RED-2.jpg"

  ];
  
  
 
@override
Widget build (BuildContext context){
  return SizedBox(
    height: 200,
    width: MediaQuery.of(context).size.width,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: productlist.length,
      itemBuilder: (context, index) =>  ProductCard(productName: productlist[index],),
    
      
        
      
    ),
  );

}
}
