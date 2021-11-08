import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoItem extends StatelessWidget {
  final Size? size;
  final String? content;
  final dynamic number;
  bool? isIcon;
  bool? isMale;
  bool? isFemale;
  InfoItem(
      {this.size,
      this.content,
      this.number,
      this.isMale,
      this.isFemale = false,
      this.isIcon = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$content ",
          style: TextStyle(fontSize: size!.shortestSide * .06),
        ),
        isIcon!
            ? isFemale == false && isMale == false
                ? Text("Not Detected")
                : Icon(isMale!
                    ? FontAwesomeIcons.male
                    : isFemale!
                        ? FontAwesomeIcons.female
                        : null)
            : Text(
                number,
                style: TextStyle(fontSize: size!.shortestSide * .05),
              ),
      ],
    );
  }
}
