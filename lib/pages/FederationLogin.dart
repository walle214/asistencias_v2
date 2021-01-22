import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart'
    show JavascriptChannel, JavascriptMessage, WebView, JavascriptMode;
// * Custom
import 'package:asistencias_v2/constants/constants.dart' show baseHttpURL;
import 'package:asistencias_v2/storage/storage.dart' show FederacionStorage;

class FederationLogin extends StatelessWidget {
  JavascriptChannel _createJavascriptChannel(BuildContext context) =>
      JavascriptChannel(
        name: 'Login',
        onMessageReceived: (JavascriptMessage message) {
          FederacionStorage.storeData(context, message.message).then(
            (_) {
              Navigator.pushNamedAndRemoveUntil(
                  context, 'plantel', (route) => false);
            },
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
