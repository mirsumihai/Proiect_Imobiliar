import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobilePage;
  final Widget desktopPage;

  //-> constructor
//cheia e unica, cu cheia putem sa ii schimbam state-ul, din stateless in stateful
  const ResponsiveLayout(
      {Key? key, required this.mobilePage, required this.desktopPage})
      : super(key: key);

  //required mobileBody

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return mobilePage;
      } else {
        return desktopPage;
      }
    });
  }
}
