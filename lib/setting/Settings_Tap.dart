import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/Home/my_theme.dart';
import 'package:news/provider/app_config_provider.dart';
import 'package:news/setting/language_bottom_sheet.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<appconfigprocider>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                showlanguagebuttomsheet();
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: MyTheme.prim,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      provider.applang == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showlanguagebuttomsheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => languagebottomsheet(),
    );
  }

}
