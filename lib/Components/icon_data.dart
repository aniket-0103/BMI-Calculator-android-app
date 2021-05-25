import 'package:bmi_calculator/Constants.dart';
import 'package:flutter/material.dart';

class Icon_data extends StatelessWidget {
  Icon_data({@required this.icon, this.label});
  final IconData icon ;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        Icon(icon,
            size: 50.0),
        SizedBox(height: 20.0,),
        Text(label,
          style: ktextStyle
        )
      ],
    );
  }
}
