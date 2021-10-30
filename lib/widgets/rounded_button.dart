import 'package:flutter/material.dart';

class WidgetButtons extends StatelessWidget {
  WidgetButtons(
      {@required this.title, @required this.color, @required this.onPress});
  final Color color;
  final Function onPress;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color, //Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            //Go to login screen.
            onPress();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
