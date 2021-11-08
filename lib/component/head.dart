import 'package:flutter/material.dart';

class HeadItem extends StatelessWidget {
  final Size? size;
  final String? head;
  double? sizeAmount;
  HeadItem({this.head, this.size, this.sizeAmount = .072, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      head!,
      style: TextStyle(
        fontSize: size!.shortestSide * sizeAmount!,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
    );
  }
}
