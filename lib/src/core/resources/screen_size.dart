import 'package:flutter/cupertino.dart';

class ScreenSize {



  static double width(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static double paddingTop(BuildContext context){
    return MediaQuery.of(context).padding.top;
  }

  static double paddingBottom(BuildContext context){
    return MediaQuery.of(context).padding.bottom;
  }
}