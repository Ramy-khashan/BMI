import 'package:flutter/cupertino.dart';

class InformationController {
  String type = '';
  String advice = '';
  void compare(double bmi) {
    if (bmi < 18.5) {
      type = "UnderWeight";
      advice =
          "That's not good for your health take care of your health and try togain some weight";
    } else if (18.5 <= bmi && bmi < 25.0) {
      type = "Normal";
      advice = "That's good for your health take care of your health";
    } else if (bmi >= 25 && bmi < 30.0) {
      type = "OverWeight";
      advice =
          "That's not good for your health take care of your health and try lose some weight ";
    } else if (bmi >= 30.0 && bmi < 34.9) {
      type = "Obese";
      advice =
          "Thats bad for your health take care of your health and tyr to lose weight and do exercises";
    } else if (bmi >= 35.0) {
      advice =
          "That's very dangerous for your health take care of your health and go to doctor for your health";
      type = "Extermly Obese";
    }
  }

  List<String> info = ["Gender Icon: ", "Age: ", "Weight: ", "Tall: "];
}
