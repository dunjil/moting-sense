import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget child;
  ReusableCard({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        color: Color(0XFF0D1E33),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(15.0),
    );
  }
}
