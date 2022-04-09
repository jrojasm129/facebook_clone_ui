import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({ 
      Key? key, 
      required this.mobile, 
      this.tablet, 
      required this.desktop 
  }) : super(key: key);

  static bool isDesktop(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    return width >= 1200;
  }

  static bool isTablet(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    return width >= 800 && width < 1200;
  }

  static bool isMobile(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    return width < 800;
  }

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    if(width >= 1200){
      return desktop;
    } else if(width >= 800 && width < 1200 ){
      return tablet?? mobile;
    } else {
      return mobile;
    }


  }
}