import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bmi/screens/homepage/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePageController extends Cubit<BmiStates> {
  bool isMale = false;
  bool isFemale = false;
  late int weight = 80;
  late int age = 20;
  late double tall = 185;
  var weightAndAge = ["Weight", "Age"];
  var maleAndFemale = [
    Content(head: "Male", icon: FontAwesomeIcons.male),
    Content(head: "Female", icon: FontAwesomeIcons.female),
  ];
  static HomePageController get(_) => BlocProvider.of(_);
  HomePageController() : super(InitialState());
  void add(int index) {
    if (index == 0) {
      weight++;
    } else {
      age++;
    }
    emit(AddState());
  }

  void gender(int index) {
    if (index == 0) {
      isMale = !isMale;
      isFemale = false;
    } else if (index == 1) {
      isFemale = !isFemale;
      isMale = false;
    }
    emit(GenderState());
  }

  void tallDetect(double val) {
    tall = val;
    emit(TallDetectState());
  }

  void minus(int index) {
    if (index == 0) {
      weight--;
    } else {
      age--;
    }
    emit(MinusState());
  }

  double bmiOperation() {
    double m = tall / 100;
    var h = pow(m, 2);
    double bmi = weight / h;
    emit(BmiOperatorState());
    return bmi;
  }
}

class Content {
  final String? head;
  final IconData? icon;

  Content({this.head, this.icon});
}
