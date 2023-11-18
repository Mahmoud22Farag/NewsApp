import 'package:flutter/material.dart';
import 'package:news/Home/my_theme.dart';
import 'package:news/model/SourcesRespones.dart';

class TapItem extends StatelessWidget {
 Source source;
 bool isSelected;
 TapItem({required this.source,required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color:MyTheme.prim,width: 3 ),
    color: isSelected ? MyTheme.prim : Colors.transparent
      ),
      child: Text(source.name??"",
      style: isSelected ? Theme.of(context).textTheme.titleLarge?.copyWith(color: MyTheme.white)
          :
      Theme.of(context).textTheme.titleLarge?.copyWith(color: MyTheme.prim)
      ),
    );
  }
}
