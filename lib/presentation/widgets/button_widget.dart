import 'package:flutter/material.dart';
import 'package:suitmedia/core/resources/color.dart';
import 'package:suitmedia/core/resources/font.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Color color;

  const ButtonWidget(
    this.title, {
    super.key,
    required this.onPressed,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            backgroundColor: color,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0))),
        child: Padding(
            padding: const EdgeInsets.all(14),
            child: Text(
              title,
              style: bold.copyWith(fontSize: 15, color: cWhite),
            )),
      ),
    );
  }
}
