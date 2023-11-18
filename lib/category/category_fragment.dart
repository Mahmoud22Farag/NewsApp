import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/category/categoryDM.dart';
import 'package:news/category/category_item.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CategoryFragment extends StatelessWidget {
  var CategoriesList = CategoryDM.getCategories();
  Function onCategoryClick;
  CategoryFragment({required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.pick,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategoryClick(CategoriesList[index]);
                    },
                    child: CategoryItem(categoryDM: CategoriesList[index], index: index));
              },
              itemCount: CategoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
