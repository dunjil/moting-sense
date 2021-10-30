import 'package:cloud_firestore/cloud_firestore.dart';

class SensorsModel {
  final bool frontDoorEntrance;
  final bool dinningEntrance;
  final bool kitchenEntrance;
  final bool stairCaseDecelerating;
  final bool bedroomEntrance;
  final bool stairCaseAccelerating;
  final bool frontDoorEntrance2;
  final bool bathroom;

  SensorsModel(
      {this.frontDoorEntrance,
      this.dinningEntrance,
      this.kitchenEntrance,
      this.stairCaseDecelerating,
      this.bedroomEntrance,
      this.stairCaseAccelerating,
      this.frontDoorEntrance2,
      this.bathroom});

  factory SensorsModel.fromDocument(DocumentSnapshot doc) {
    return SensorsModel(
        frontDoorEntrance: doc["frontDoorEntrance"],
        dinningEntrance: doc["dinningEntrance"],
        kitchenEntrance: doc["kitchenEntrance"],
        stairCaseDecelerating: doc["stairCaseDecelerating"],
        bedroomEntrance: doc["bedroomEntrance"],
        stairCaseAccelerating: doc["stairCaseAccelerating"],
        frontDoorEntrance2: doc["frontDoorEntrance2"],
        bathroom: doc["bathroom"]);
  }
}
