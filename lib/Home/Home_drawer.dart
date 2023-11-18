import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/Home/my_theme.dart';

class HomeDrawer extends StatelessWidget {
  static const int category =1;
  static const int settings =2;

  Function onSideMenueItem;

  HomeDrawer({required this.onSideMenueItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.1),
          color: MyTheme.prim,
          child: Text(
            AppLocalizations.of(context)!.app_title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            onSideMenueItem(HomeDrawer.category);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(Icons.list),
                SizedBox(
                  width: 5,
                ),
                Text(
                  AppLocalizations.of(context)!.categories,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            onSideMenueItem(HomeDrawer.settings);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(
                  width: 5,
                ),
                Text(
                  AppLocalizations.of(context)!.settings,
                  style: Theme.of(context).textTheme.titleMedium,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
