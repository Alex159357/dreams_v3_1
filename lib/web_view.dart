
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WebViewModule extends StatefulWidget {
  final String link;
  const WebViewModule(this.link, {Key? key}) : super(key: key);

  @override
  _WebViewModuleState createState() => _WebViewModuleState();
}

class _WebViewModuleState extends State<WebViewModule> {

  late WebViewController _controller;
  final String localStorageCookie = '''{"id":119,"user_info":{"id":4}}''';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: WebView(
          gestureNavigationEnabled: true,
          onWebResourceError: (v){
            Fluttertoast.showToast(
                msg: v.description,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          },
          onWebViewCreated: (WebViewController c){
            c.clearCache();
            _controller = c;
          },
          onPageFinished: (_) async {
            // await _controller.evaluateJavascript(
            //     "window.localStorage.setItem('tenant_auth_setting', $localStorageCookie);");
            // await _controller.evaluateJavascript(
            //     "window.localStorage.setItem('user_profile', $localStorageCookie);");
            // print('page finished');
          },
          initialUrl: widget.link,
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (NavigationRequest request) {
            if (request.url.contains("mailto:")) {
              _launchURL(request.url);
              return NavigationDecision.prevent;
            } else if (request.url.contains("tel:")) {
              _launchURL(request.url);
              return NavigationDecision.prevent;
            } else if (request.url.contains("facetime-audio:")) {
              _launchURL(request.url);
              return NavigationDecision.prevent;
            }else if (request.url.contains("sms:")) {
              _launchURL(request.url);
              return NavigationDecision.prevent;
            }else if (request.url.contains("imessage:")) {
              _launchURL(request.url);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(
          msg: 'Could not launch $url',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      throw 'Could not launch $url';
    }}

}
