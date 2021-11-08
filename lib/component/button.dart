import 'package:flutter/material.dart';

class ButtonItem extends StatelessWidget {
  final Function()? onPress;
  final Size? size;
  final String? name;
  const ButtonItem({this.name, this.onPress, this.size, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: size!.longestSide * .085),
        height: size!.longestSide * .075,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade700),
        child: Center(
            child: Text(
          name!,
          style: TextStyle(
              fontSize: size!.shortestSide * .07,
              fontWeight: FontWeight.w800,
              letterSpacing: 3,
              fontFamily: 'habdwritten'),
        )),
      ),
    );
  }
}
