import 'package:flutter/material.dart';
import 'package:news/Home/my_theme.dart';

import 'categoryDM.dart';

class CategoryItem extends StatelessWidget {
  CategoryDM categoryDM;
  int index;
  CategoryItem({required this.categoryDM,required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryDM.color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20) ,
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(index%2==0? 0 : 20),
          bottomLeft: Radius.circular(index%2==0? 20 : 0),

        )
      ),
      child: Column(
        children: [
          Image.asset(categoryDM.image,
          height: MediaQuery.of(context).size.height*0.15,
          ),
          Text(categoryDM.title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: MyTheme.white),
          ),
        ],
      ),
    );
  }
}
