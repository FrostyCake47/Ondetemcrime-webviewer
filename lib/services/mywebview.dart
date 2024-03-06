import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  const MyWebView({super.key});

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  late WebViewController controller;
  late final WebViewCookieManager cookieManager = WebViewCookieManager();

  void clearCookiesAndReload() {
    cookieManager.clearCookies().then((_) {
      controller.reload();
    });
  }

  @override
  void initState() {
    super.initState();
    controller = WebViewController(
  )
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setUserAgent("random")
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://any-site-you-dont-want-to-allow/')) {
          return NavigationDecision.prevent;
        }
        if(request.url.contains('https://ondetemcrime.com.br/logout')){
          clearCookiesAndReload();
        }
        return NavigationDecision.navigate;
      },
      
    ),
  )
  ..loadRequest(Uri.parse('https://ondetemcrime.com.br/'));

  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: controller);
  }
}