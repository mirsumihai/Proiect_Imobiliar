import 'package:flutter/material.dart';
import 'package:flav/responsive/responsive_layout.dart';

import 'features/home/ui/desktop/home_desktop_page.dart';
import 'features/home/ui/mobile/home_mobile_page.dart';

void main(){
  runApp(RealEstateApp());
}

class RealEstateApp extends StatelessWidget{ //stau StatefulWidget
  @override
  Widget build(BuildContext buildContext){
    return MaterialApp(
      title: 'Real Estate App',
      debugShowCheckedModeBanner: false, //ca sa nu apara banneru pt debug, dar de regula e mai bun true cand faci development, dar la release false
      theme: ThemeData(primarySwatch: Colors.blue), //primaryColorDark
      home: ResponsiveLayout(mobilePage: HomeMobilePage(), desktopPage: HomeDesktopPage()), //ne ajuta sa facem pagina responsive
    );
  }

}