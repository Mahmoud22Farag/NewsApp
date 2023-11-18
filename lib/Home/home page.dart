import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/Api/api_manger.dart';
import 'package:news/Home/Home_drawer.dart';
import 'package:news/Home/my_theme.dart';
import 'package:news/News/NewsItem.dart';
import 'package:news/category/categoryDM.dart';
import 'package:news/category/category_detalise.dart';
import 'package:news/category/category_fragment.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/setting/Settings_Tap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            selectedMenueItem ==HomeDrawer.settings?AppLocalizations.of(context)!.settings:
                selectedcategory==null?
                AppLocalizations.of(context)!.app_title :
                    selectedcategory!.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchUser());
              },
              icon: Icon(Icons.search_sharp),
            )
          ] ,
        ),
        drawer: Drawer(
          child: HomeDrawer(onSideMenueItem: onSideMuneItem),
        ),

        body:selectedMenueItem ==HomeDrawer.settings?
            Settings()
            :
        selectedcategory == null
            ? CategoryFragment(
                onCategoryClick: OnCategoryClick,
              )
            : CategoryDetailse(category: selectedcategory!));
  }

  CategoryDM? selectedcategory;

  void OnCategoryClick(CategoryDM newSelectedCategory) {
    selectedcategory = newSelectedCategory;
    setState(() {});
  }

  int selectedMenueItem = HomeDrawer.category;

  void onSideMuneItem(int newSelectedMuneItem) {
    selectedMenueItem = newSelectedMuneItem;
    selectedcategory=null;
    Navigator.pop(context);
    setState(() {

    });
  }
}

class SearchUser extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {

    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    return FutureBuilder<NewsResponse>(

        future: ApiManger.getNewsBysourceid(query: query),
        builder: (context,snapshot){
          if (snapshot.connectionState ==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(
              color: MyTheme.prim,
            ));
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('somthing went wrong'),
                ElevatedButton(onPressed: () {

                  ApiManger.getNewsBysourceid(query:query );

                }, child: Text('try again')),
              ],
            );
          }
          if (snapshot.data?.status != 'ok') {
            return Text(snapshot.data?.message??'somthing went wrong');
          }
          var NewsList =snapshot.data?.articles ??[];
          return ListView.builder(itemBuilder: (context,index){
            return NewsItem(news: NewsList[index]);
          },
            itemCount: NewsList.length,
          );
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('suggestions');
  }
}

