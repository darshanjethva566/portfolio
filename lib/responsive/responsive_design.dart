import 'package:flutter/material.dart';

class ResponsiveDesign extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final Widget tablet;
  final Color bgcolor;
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
          MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
  const ResponsiveDesign({required this.mobile,required this.desktop,required this.tablet,required this.bgcolor, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth<600){
        return Container(child: mobile,color: bgcolor,);
      }
      else if(constraints.maxWidth<1200){
        return Container(child: tablet,color: bgcolor,);
      }
      else{
        return Container(child: desktop,color: bgcolor,);
      }
    },);
  }
}
