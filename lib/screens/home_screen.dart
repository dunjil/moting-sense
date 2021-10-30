import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motionsense/sensors_model.dart';
import '../widgets/reusable_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/reusable_column.dart';

final _firestore = Firestore.instance;

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Motion Sense",
          style: GoogleFonts.montserrat(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: SensorReadings(),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  left: 12.0, right: 12.0, top: 5.0, bottom: 5.0),
              margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: messageController,
                      cursorColor: Colors.white70,
                      decoration: InputDecoration(
                        fillColor: Color(0XFF3A3944),
                        border: InputBorder.none,
                        labelText: "Type in report",
                        hasFloatingPlaceholder: false,
                        labelStyle: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 14.0),
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                  IconButton(
                    onPressed: () => messageController.text != null
                        ? sendMessage()
                        : printEmptyMessage(),
                    icon: Icon(
                      Icons.send,
                      color: Color(0XFF808195),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  sendMessage() async {
    await _firestore.collection("messages").add({
      "message": messageController.text,
      "time": DateTime.now(),
    });
    messageController.clear();
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  printEmptyMessage() {
    print("Cannot send empty message");
  }
}

//This section of the code connects to firestore to fetch the information supplied by the sensor
class SensorReadings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection("home").document('sensors111').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          SensorsModel sensor = SensorsModel.fromDocument(snapshot.data);
          return Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        child: ReusableColumn(
                          sensorName: "Front door Entrance",
                          reading: sensor.frontDoorEntrance,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        child: ReusableColumn(
                          sensorName: "Dinning Entrance",
                          reading: sensor.dinningEntrance,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        child: ReusableColumn(
                          sensorName: "Kitchen Entrance",
                          reading: sensor.kitchenEntrance,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        child: ReusableColumn(
                          sensorName: "Stair case(Deceleration)",
                          reading: sensor.stairCaseDecelerating,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        child: ReusableColumn(
                          sensorName: "Bedroom Entrance",
                          reading: sensor.bedroomEntrance,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        child: ReusableColumn(
                          sensorName: "Stair case (Accelerating)",
                          reading: sensor.stairCaseAccelerating,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        child: ReusableColumn(
                          sensorName: "Front door Entrance",
                          reading: sensor.frontDoorEntrance2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        child: ReusableColumn(
                          sensorName: "Bathroom",
                          reading: sensor.bathroom,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: Text(
              "Loading...(Please ensure you are connected to the Internet",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(fontSize: 18.0),
            ),
          );
        }
      },
    );
  }
}
