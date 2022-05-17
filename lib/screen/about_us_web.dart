import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUsWeb extends StatefulWidget {
  AboutUsWeb({Key? key}) : super(key: key);

  @override
  State<AboutUsWeb> createState() => _AboutUsWebState();
}

class _AboutUsWebState extends State<AboutUsWeb> {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://www.idigitalpreneur.com/know-us',
    );
  }
}
