import 'package:flutter/material.dart';

class ResponsiveDesign extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final Widget tablet;
  final Color bgcolor;

  const ResponsiveDesign({required this.mobile,required this.desktop,required this.tablet,required this.bgcolor, super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth<600){
        return Container(child: mobile,);
      }
      else if(constraints.maxWidth<1200){
        return Container(child: tablet,);
      }
      else{
        return Container(child: desktop,);
      }
    },);
  }
}
