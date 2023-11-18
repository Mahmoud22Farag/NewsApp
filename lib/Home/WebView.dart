import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatefulWidget {
  static const String route ="webviwe";

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  @override
  Widget build(BuildContext context) {
    var link =ModalRoute.of(context)?.settings.arguments as String;
    WebViewController controller =WebViewController()..loadRequest(Uri.parse(link));
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
          AppLocalizations.of(context)!.webviwe

          ,style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: WebViewWidget(controller:controller ,),
    );
  }


}
