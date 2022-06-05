import 'dart:async';

import 'package:news_info/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class WebViewModul extends StatefulWidget {
  const WebViewModul({Key? key, required this.links}) : super(key: key);

  final String links;

  @override
  State<WebViewModul> createState() => _WebViewState();
}

class _WebViewState extends State<WebViewModul> {
  late WebViewController controller;
  final Completer<WebViewController> controllertwo =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    var webView = WebView(
      initialUrl: widget.links,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {
        controllertwo.complete(controller);
        this.controller = controller;
      },
      onProgress: (url) {
        {
          controller.evaluateJavascript(
              "document.getElementsByClassName('row u-full-width')[0].style.display='none';");
          controller.evaluateJavascript(
              "document.getElementsByClassName('mt-1')[0].style.display='none';");
          controller.evaluateJavascript(
              "document.getElementsByClassName('author')[0].style.display='none';");
          controller.evaluateJavascript(
              "document.getElementsByTagName('nav')[1].style.display='none';");
          controller.evaluateJavascript(
              "document.getElementById('videoContent').style.display='none';");
          controller.evaluateJavascript(
              "document.getElementById('comment_wrapper').style.display='none';");
          controller.evaluateJavascript(
              "document.getElementById('scroll-top').style.display='none';");
          controller.evaluateJavascript(
              "document.getElementsByTagName('footer')[0].style.display='none';");
          controller.evaluateJavascript(
              "document.getElementsByClassName('footer-bottom')[0].style.display='none';");
          controller.evaluateJavascript(
              "var appBanners = document.getElementsByClassName('row item');");
          controller.evaluateJavascript(
              "for (var i = 0; i < appBanners.length; i ++) {appBanners[i].style.display = 'none';}");
          controller.evaluateJavascript(
              "var appBanners = document.getElementsByTagName('ins');");
          controller.evaluateJavascript(
              "for (var i = 0; i < appBanners.length; i ++) {appBanners[i].style.display = 'none';}");
          controller.evaluateJavascript(
              "var appBanners = document.getElementsByTagName('span');");
          controller.evaluateJavascript(
              "for (var i = 0; i < appBanners.length; i ++) {appBanners[i].style.display = 'none';}");
          controller.evaluateJavascript(
              "var appBanners = document.getElementsByClassName('widget-title bg-gray');");
          controller.evaluateJavascript(
              "for (var i = 0; i < appBanners.length; i ++) {appBanners[i].style.display = 'none';}");
          controller.evaluateJavascript("");
          controller.evaluateJavascript("");
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: true,
        actions: const [],
        centerTitle: true,
        elevation: 4,
      ),
      body: webView,
    );
  }
}
