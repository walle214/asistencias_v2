import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart'
    show JavascriptChannel, JavascriptMessage, WebView, JavascriptMode;
// * Custom
import 'package:asistencias_v2/constants/constants.dart' show baseHttpURL;

class FederationLogin extends StatelessWidget {
  JavascriptChannel _createJavascriptChannel(BuildContext context) =>
      JavascriptChannel(
        name: 'Login',
        onMessageReceived: (JavascriptMessage message) {
          // inicialize provider and saves data recived from login if succesfull in provider
          // final waifuProvider =
          // Provider.of<DatosFederacion>(context, listen: false);
          // waifuProvider.initWaifuData(message.message);
          //saves data from user when login in localstorage
          // storeUser(message.message);
          // TODO store data
          print(message);
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/',
            (route) => false,
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SafeArea(
          child: WebView(
            initialUrl: baseHttpURL + 'login.php',
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: <JavascriptChannel>[
              _createJavascriptChannel(context),
            ].toSet(),
            gestureNavigationEnabled: true,
          ),
        ),
      ),
    );
  }
}
