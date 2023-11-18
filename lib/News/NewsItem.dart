import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/Home/my_theme.dart';
import 'package:news/News/NewsDetalisScreen.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  News news;
  NewsItem({required this.news});
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, NewsDetailsScreen.route,arguments: news);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage??'',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 10,),
            Text(news.author??'',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 14,color: MyTheme.gray),
            ),
            Text(news.title??'',
            style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 5,),
            Text( timeago.format( DateTime.parse(news.publishedAt??'')),

              //DateTime.parse(news.publishedAt??'').difference(DateTime.now()).inHours.toString(),
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 14,color: MyTheme.gray),
            ),
          ],
        ),
      ),
    );
  }
}
