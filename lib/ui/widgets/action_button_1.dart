import 'package:flutter/material.dart';
import 'dart:math';
import 'package:neopop/neopop.dart';

class ActionButton1 extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final Color initialTextColor;
  final Color initialBorderColor;
  final double borderRadius;
  final double borderWidth;
  final VoidCallback? onPressed;

  const ActionButton1({
    super.key,
    required this.text,
    this.backgroundColor = Colors.black,
    this.initialTextColor = Colors.white,
    this.initialBorderColor = Colors.white,
    this.borderRadius = 20.0,
    this.borderWidth = 2.0,
    this.onPressed,
  });

  @override
  ActionButton1State createState() => ActionButton1State();
}

class ActionButton1State extends State<ActionButton1> {
  late Color textColor;
  late Color borderColor;

  @override
  void initState() {
    super.initState();
    textColor = widget.initialTextColor;
    borderColor = widget.initialBorderColor;
  }

  static Color getRandomColor() {
    final List<Color> rainbowColors = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
    ];
    return rainbowColors[Random().nextInt(rainbowColors.length)];
  }

  void _resetColors() {
    setState(() {
      textColor = widget.initialTextColor;
      borderColor = widget.initialBorderColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NeoPopButton(
      color: widget.backgroundColor,
      border: Border.all(color: borderColor, width: widget.borderWidth),
      onTapUp: () {
        _resetColors();
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      onTapDown: () {
        setState(() {
          Color randomColor = getRandomColor();
          textColor = randomColor;
          borderColor = randomColor;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
