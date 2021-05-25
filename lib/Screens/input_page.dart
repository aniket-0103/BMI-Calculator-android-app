import 'package:bmi_calculator/Components/bottom_button.dart';
import 'package:bmi_calculator/Components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/input_box.dart';
import '../Components/icon_data.dart';
import '../Constants.dart';
import '../calculator_brain.dart';
import '../Screens/results_page.dart';
enum Gender{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color Gendercardcolor;
  Gender selectedGender;
  int Height = 180;
  int weight = 50;
  int age = 25;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget> [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Input_box(
                    onPressed: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    childCard: Icon_data(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                    colour: Gendercardcolor =
                      selectedGender == Gender.male ? kdark : klight_dark
                  )
                ),
                Expanded(
                  child:Input_box(
                    onPressed: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    childCard: Icon_data(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                    colour: Gendercardcolor =
                    selectedGender == Gender.male ? klight_dark : kdark
                  )
                ),
              ],
            ),
          ),
          Expanded(
            child: Input_box(
              colour: kdark,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Height',
                    style: ktextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children : <Widget>[
                      Text(Height.toString(),
                        style: kdigitStyle),
                      Text("cm",
                        style: ktextStyle)
                    ] 
                  ),
                  Slider(
                    value: Height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: ksecColor,
                    inactiveColor: Colors.grey,
                    onChanged: (value){
                      setState(() {
                        Height = value.round();
                      });
                    },
                  )
                ],
              ),
            )
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Input_box(
                    colour: kdark,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Weight",
                        style: ktextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(weight.toString(),
                              style: kdigitStyle),
                            Text("Kg",
                              style: ktextStyle,)
                          ],
                        ) ,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedButton(
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus
                            ),
                            SizedBox(width: 10.0,),
                            RoundedButton(
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus)
                          ],
                        )

                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Input_box(
                    colour: kdark,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Age",
                            style: ktextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(age.toString(),
                                style: kdigitStyle),
                            Text("Yrs",
                              style: ktextStyle,)
                          ],
                        ) ,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundedButton(
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus
                            ),
                            SizedBox(width: 10.0,),
                            RoundedButton(
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus)
                          ],
                        )

                      ],
                    ),
                  )
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
              CalculatorBrain(height: Height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    result: calc.calculateBMI(),
                    note: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],

      ),

    );
  }
}

