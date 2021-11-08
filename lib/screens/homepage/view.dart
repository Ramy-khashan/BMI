import 'package:bmi/component/button.dart';
import 'package:bmi/component/chip.dart';
import 'package:bmi/component/head.dart';
import 'package:bmi/screens/homepage/controller.dart';
import 'package:bmi/screens/homepage/states.dart';
import 'package:bmi/screens/information/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomePageController(),
      child: Scaffold(
        appBar: AppBar(
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
        body: BlocConsumer<HomePageController, BmiStates>(
          listener: (context, state) {},
          builder: (context, state) {
            final controller = HomePageController.get(context);
            return Column(
              children: [
                Expanded(
                    child: Row(
                  children: List.generate(
                    2,
                    (index) => Expanded(
                      child: GestureDetector(
                        onTap: () => controller.gender(index),
                        child: Container(
                          margin: EdgeInsets.all(size.shortestSide * .02),
                          decoration: BoxDecoration(
                            color: index == 0
                                ? controller.isMale
                                    ? Colors.grey.shade800
                                    : Colors.grey.shade700
                                : controller.isFemale
                                    ? Colors.grey.shade800
                                    : Colors.grey.shade700,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black26,
                                  offset: Offset(-3, 5),
                                  spreadRadius: 7),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              HeadItem(
                                head: controller.maleAndFemale[index].head,
                                size: size,
                              ),
                              Icon(
                                controller.maleAndFemale[index].icon,
                                size: size.shortestSide * .11,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(size.shortestSide * .02),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 10,
                            color: Colors.black26,
                            offset: Offset(-3, 5),
                            spreadRadius: 7),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HeadItem(
                          head: "Tall",
                          size: size,
                          sizeAmount: .09,
                        ),
                        Text(
                          controller.tall.toStringAsFixed(1),
                          style: TextStyle(
                              fontSize: size.shortestSide * .05,
                              fontWeight: FontWeight.w600),
                        ),
                        Slider(
                            activeColor: Colors.blueGrey.shade100,
                            inactiveColor: Colors.blueGrey.shade900,
                            value: controller.tall,
                            max: 220,
                            min: 80,
                            onChanged: (val) => controller.tallDetect(val))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: List.generate(
                      2,
                      (index) => ChipItem(
                        add: () => controller.add(index),
                        minus: () => controller.minus(index),
                        head: controller.weightAndAge[index],
                        itemNum:
                            index == 0 ? controller.weight : controller.age,
                        size: size,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: size.longestSide * .01),
                  child: ButtonItem(
                    name: "Calculate",
                    onPress: () {
                      controller.bmiOperation();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InformationScreen(
                                    controlerBloc: controller,
                                  )));
                    },
                    size: size,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
