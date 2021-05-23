import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class InAppBrowser extends StatefulWidget {
  final String webUrl;
  InAppBrowser({this.webUrl});
  @override
  InAppBrowserState createState() => InAppBrowserState();
}

class InAppBrowserState extends State<InAppBrowser> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(''),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: WebView(
        initialUrl: widget.webUrl,
      ),
    );
  }
}