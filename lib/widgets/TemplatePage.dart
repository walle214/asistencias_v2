import 'package:flutter/material.dart';
// * Custom
import 'package:asistencias_v2/widgets/buttons/buttons.dart'
    show BackButtonBlue;
import 'package:asistencias_v2/widgets/widgets.dart' show AppBarUDC;

class TemplatePage extends StatelessWidget {
  final Widget child;
  final String appBarTitle;
  final String title;
  final String subtitle;
  const TemplatePage({
    Key key,
    @required this.child,
    this.appBarTitle = 'Control de asistencias',
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppBarUDC(title: appBarTitle),
          title != null
              ? _PageTitle(title: title, subtitle: subtitle)
              : Container(),
          Expanded(child: child),
          Navigator.canPop(context) ? BackButtonBlue() : Container(),
        ],
      ),
    );
  }
}

class _PageTitle extends StatelessWidget {
  const _PageTitle({
    Key key,
    @required this.title,
    this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
      child: Column(
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: subtitle == null ? 0 : 8),
          subtitle == null
              ? Container()
              : Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
          Divider(color: Colors.black54, indent: 20.0, height: 15.0),
        ],
      ),
    );
  }
}
