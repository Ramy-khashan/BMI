import 'dart:math';

import 'package:bmi/component/button.dart';
import 'package:bmi/component/head.dart';
import 'package:bmi/component/info.dart';
import 'package:bmi/screens/homepage/controller.dart';
import 'package:bmi/screens/homepage/states.dart';
import 'package:bmi/screens/imginfo/view.dart';
import 'package:bmi/screens/information/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InformationScreen extends StatefulWidget {
  final dynamic controlerBloc;
  const InformationScreen({this.controlerBloc, Key? key}) : super(key: key);

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  void initState() {
    controller.compare(widget.controlerBloc.bmiOperation());
    super.initState();
  }

  final controller = InformationController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.help),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        fullscreenDialog: false,
                        builder: (context) => ImageScreen()));
              }),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blueGrey.shade600, Colors.black])),
          ),
          title: Container(
            padding: EdgeInsets.only(top: size.shortestSide * .02),
            alignment: Alignment.bottomRight,
            child: Text("BMI",
                style: TextStyle(
                    fontSize: size.longestSide * .06,
                    letterSpacing: 6,
                    fontFamily: "habdwritten")),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.shortestSide * .02,
              vertical: size.longestSide * .02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HeadItem(
                head: "Your Information",
                size: size,
              ),
              SizedBox(height: size.longestSide * .03),
              Row(
                children: [
                  InfoItem(
                    content: controller.info[0],
                    isIcon: true,
                    isMale: widget.controlerBloc.isMale,
                    isFemale: widget.controlerBloc.isFemale,
                    size: size,
                  ),
                  const Spacer(),
                  InfoItem(
                    content: controller.info[1],
                    number: widget.controlerBloc.age.toString(),
                    size: size,
                  ),
                ],
              ),
              SizedBox(height: size.longestSide * .04),
              Row(
                children: [
                  InfoItem(
                    content: controller.info[2],
                    number: widget.controlerBloc.weight.toString(),
                    size: size,
                  ),
                  const Spacer(),
                  InfoItem(
                    content: controller.info[3],
                    number: widget.controlerBloc.tall.toStringAsFixed(1),
                    size: size,
                  ),
                ],
              ),
              SizedBox(height: size.longestSide * .06),
              HeadItem(
                head: "Your BMI",
                size: size,
              ),
              SizedBox(height: size.longestSide * .025),
              SelectableText(
                widget.controlerBloc.bmiOperation().toStringAsFixed(2),
                style: TextStyle(
                    fontSize: size.shortestSide * .06,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: size.longestSide * .05,
              ),
              Text(
                controller.type,
                style: TextStyle(
                  color: controller.type == "UnderWeight"
                      ? Colors.yellow.shade700
                      : controller.type == "Normal"
                          ? Colors.green
                          : controller.type == "OverWeight"
                              ? Colors.orange.shade700
                              : controller.type == "OverWeight"
                                  ? Colors.red.shade500
                                  : Colors.red.shade800,
                  fontSize: size.shortestSide * .07,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                height: size.longestSide * .04,
              ),
              Text(
                controller.advice,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size.shortestSide * .06,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              SizedBox(
                height: size.longestSide * .04,
              ),
              const Spacer(),
              ButtonItem(
                name: "Re-Calculate",
                onPress: () {
                  Navigator.pop(context);
                },
                size: size,
              )
            ],
          ),
        ));
  }
}
