import 'package:flutter/material.dart';

import '../../constance.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final String? label;
  final Color? color;

  final Function()? onPress;

  CustomButton({
    required this.onPress,
    this.text = 'Write text ',
    this.color = primaryColor,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(10),
      onPressed: onPress,
      minWidth: double.infinity,
      height: 50,
      color: primaryColor,
      child: Text(
        label!,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
