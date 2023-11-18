import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/Home/WebView.dart';
import 'package:news/Home/my_theme.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';


import '../Home/Home_drawer.dart';


class NewsDetailsScreen extends StatefulWidget {
  static const String route ='details';


  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override

  Widget build(BuildContext context) {

    var args =ModalRoute.of(context)?.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(

          AppLocalizations.of(context)!.details ,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              imageUrl: args.urlToImage??'',

              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: 10,),
          Text(args.author??'',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 14,color: MyTheme.gray),
          ),
          Text(args.title??'',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 5,),
          Text(
    timeago.format( DateTime.parse(args.publishedAt??'')),
           textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 14,color: MyTheme.gray),
          ),
          SizedBox(height: 10,),
          Text(args.content??''),
          SizedBox(height: 30,),
          GestureDetector(
            onTap: ()async{
              await Navigator.pushNamed(context, Webview.route,arguments: args.url??'');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Viwe More',style: Theme.of(context).textTheme.titleSmall,),
                Icon(Icons.arrow_right),
              ],),
          ),
        ],
      ),
    );
  }

}
