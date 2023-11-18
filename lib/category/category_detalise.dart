import 'package:flutter/material.dart';
import 'package:news/Home/my_theme.dart';
import 'package:news/Taps/tapcontrolr.dart';
import 'package:news/category/categoryDM.dart';
import 'package:news/category/category_details_view_model.dart';
import 'package:provider/provider.dart';

class CategoryDetailse extends StatefulWidget {
  static const String routeName = 'category_detailse';
  CategoryDM category;

  CategoryDetailse({required this.category});


  @override
  State<CategoryDetailse> createState() => _CategoryDetailseState();
}

class _CategoryDetailseState extends State<CategoryDetailse> {
  categoryDetailseViewModel viewModel = categoryDetailseViewModel();
@override
  void initState() {
    viewModel.getSourceyId(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<categoryDetailseViewModel>(builder: (context, viewModel, child) {
          if(viewModel.erorrMessage !=null){
            return Column(
              children: [
                Text(viewModel.erorrMessage!),
                ElevatedButton(onPressed: (){
                  viewModel.getSourceyId(widget.category.id);
                }, child: Text('try again'))
              ],
            );
          }
         else if (viewModel.sourceListe == null) {
            return Center(
                child: CircularProgressIndicator(
              color: MyTheme.prim,
            ));
          } else {
            return TapContaner(SourcesList: viewModel.sourceListe!);
          }
        }));

/*FutureBuilder<SourcesRespones>(
      future: ApiManger.getsources(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
                color: MyTheme.prim,
              ));
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text('somthing went wrong'),
              ElevatedButton(onPressed: () {
                ApiManger.getsources(widget.category.id);
              }, child: Text('try again')),
            ],
          );
        }
        if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(snapshot.data?.message ?? ''),
              ElevatedButton(onPressed: () {
                ApiManger.getsources(widget.category.id);
                setState(() {

                });
              }, child: Text('try again')),
            ],
          );
        }
        var sourceList = snapshot.data?.sources ?? [];
        return TapContaner(SourcesList: sourceList);
      },
    );*/
  }
}
