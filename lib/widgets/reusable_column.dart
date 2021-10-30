import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart';

class ReusableColumn extends StatelessWidget {
  final String sensorName;
  final bool reading;
  ReusableColumn({this.sensorName, this.reading});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Text(
            sensorName,
            style: GoogleFonts.montserrat(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Badge(
              badgeColor:
                  reading ? Colors.greenAccent[700] : Colors.redAccent[700],
              shape: BadgeShape.square,
              borderRadius: 50,
              toAnimate: true,
              animationType: BadgeAnimationType.slide,
              badgeContent: Center(
                child: Text(reading ? 'HIGH' : 'LOW',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
