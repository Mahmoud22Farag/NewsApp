/*import 'package:flutter/material.dart';
import 'package:newsapp/Api/api_manger.dart';
import 'package:newsapp/Home/my_theme.dart';
import 'package:newsapp/News/NewsItem.dart';
import 'package:newsapp/News/newsContinerViewModel.dart';
import 'package:newsapp/model/NewsResponse.dart';
import 'package:newsapp/model/SourcesRespones.dart';
import 'package:provider/provider.dart';


class SearchUser extends SearchDelegate {
  newsContinerModelView viewModwl=newsContinerModelView();
  @override
  void initState() {
    //viewModwl.getNewsById(widget.source.id??"");
  }
  Source userList = Source();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModwl,
      child: Consumer<newsContinerModelView>(builder: (context, viewModel, child) {
        if (viewModel.erorrMessage != null) {
          return Column(
            children: [
              Text(viewModel.erorrMessage!),
              ElevatedButton(onPressed: () {
                //viewModel.getNewsById(widget.source.id??'');
              }, child: Text('try again'))
            ],
          );
        }
        else if (viewModel.listNews == null) {
          return Center(
              child: CircularProgressIndicator(
                color: MyTheme.prim,
              ));
        } else {
          return ListView.builder(itemBuilder: (context, index) {
            return NewsItem(news: viewModwl.listNews![index]);
          },
            itemCount: viewModwl.listNews?.length,
          );
        }
      }
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}*/