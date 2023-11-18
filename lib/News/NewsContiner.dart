import 'package:flutter/material.dart';
import 'package:news/Home/my_theme.dart';
import 'package:news/News/NewsItem.dart';
import 'package:news/News/newsContinerViewModel.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourcesRespones.dart';
import 'package:provider/provider.dart';

class NewsContinar extends StatefulWidget {
  Source source;

  NewsContinar({required this.source});

  @override
  State<NewsContinar> createState() => _NewsContinarState();
}

class _NewsContinarState extends State<NewsContinar> {
  newsContinerModelView viewModwl = newsContinerModelView();
  @override
  late ScrollController controller;
  List<News>allartils=[];
  int page=1;

  void initState() {
    controller = ScrollController();
    controller.addListener(() {
if(controller.position.atEdge){
  if(controller.offset!=0){
    setState(() {
      page++;
      controller.jumpTo(0);
    });
  }
}
    });
    viewModwl.getNewsById(widget.source.id ?? "");
  }
  @override
  void dispose() {
    super.dispose();
  controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModwl,
      child: Consumer<newsContinerModelView>(builder: (context, viewModel, child) {
        if (viewModel.erorrMessage != null) {
          return Column(
            children: [
              Text(viewModel.erorrMessage!),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getNewsById(widget.source.id ?? '');
                  },
                  child: Text('try again'))
            ],
          );
        } else if (viewModel.listNews == null) {
          return Center(
              child: CircularProgressIndicator(
            color: MyTheme.prim,
          ));
        } else {
          return ListView.builder(
            controller: controller,
            itemBuilder: (context, index) {
              return NewsItem(news: viewModwl.listNews![index]);
            },
            itemCount: viewModwl.listNews?.length,
          );
        }
      }),
    );

  }
}
