import 'package:bmi/component/head.dart';
import 'package:flutter/material.dart';

class ChipItem extends StatelessWidget {
  const ChipItem(
      {Key? key, this.add, this.head, this.itemNum, this.minus, this.size})
      : super(key: key);
  final String? head;
  final Function()? add;
  final Function()? minus;
  final int? itemNum;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(size!.shortestSide * .01),
        margin: EdgeInsets.all(size!.shortestSide * .02),
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
              head: head,
              size: size,
            ),
            SizedBox(
              height: size!.longestSide * .01,
            ),
            Text(
              itemNum.toString(),
              style: TextStyle(
                  fontSize: size!.shortestSide * .06,
                  fontWeight: FontWeight.w600),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: minus,
                    icon: Icon(
                      Icons.remove,
                      size: size!.shortestSide * .08,
                    )),
                IconButton(
                    onPressed: add,
                    icon: Icon(
                      Icons.add,
                      size: size!.shortestSide * .08,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
