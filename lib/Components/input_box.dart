import 'package:flutter/material.dart';

class Input_box extends StatelessWidget {
  //
  Input_box({@required this.colour, this.childCard, this.onPressed});

  final Color colour;
  final Widget childCard;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: childCard,
        // height: 150.0,
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}
