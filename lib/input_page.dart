import 'package:bmi_calculator/results_page2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'file:///D:/FlutterProjects/bmi_calculator/lib/constants.dart';
import 'round_icon_button.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

// ENUMs
enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 165;
  int weight = 75;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  Text(
                    'Developer',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 30.0,
                        fontFamily: 'Montez',
                        fontWeight: FontWeight.w900),
                  ),
                  CircleAvatar(
                    radius: 45.0,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                ],
              ),
              decoration: BoxDecoration(color: Colors.blueGrey),
            ),
            ListTile(
              title: Text(
                'Amir Honarmand',
                style: TextStyle(
                  fontSize: 35.0,
                  fontFamily: 'Baloo2',
                ),
              ),
            ),
            ListTile(
              title: Text(
                'ahonarmand.dev@gmail.com',
                style: TextStyle(fontSize: 20.0, fontFamily: 'Baloo2'),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //Male & Female
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.male,
                    label: 'Male',
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.female,
                    label: 'Female',
                  ),
                )),
              ],
            ),
          ),
          //Height & Slider
          Expanded(
              child: ReusableCard(
            colour: kActiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Height',
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.blueGrey[700],
                    inactiveTrackColor: Colors.blueGrey[300],
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    thumbColor: Colors.indigo,
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    overlayColor: Color(0x493f51b5),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 210.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.toInt();
                      });
                    },
                  ),
                )
              ],
            ),
          )),
          //Weight & Age
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Weight',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Age',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 25.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          //BMI Button
          BottomButton(
              buttonTitle: 'Calculate BMI',
              onTap: () {
                CalculatorBrain calcBMI =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BMIResultsPage(
                              resultText: calcBMI.calculateBMI(),
                              bmiResult: calcBMI.getBMIResult(),
                              interpretation: calcBMI.getBMIInterpretation(),
                            )));
              }),
          // PI Button
          // BottomButton(
          //     buttonTitle: 'Calculate PI',
          //     onTap: () {
          //       CalculatorBrain calcPI =
          //           CalculatorBrain(height: height, weight: weight);
          //
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => PIResultsPage(
          //                     resultText: calcPI.calculateBMI(),
          //                     bmiResult: calcPI.getBMIResult(),
          //                     interpretation: calcPI.getBMIInterpretation(),
          //                   )));
          //     }),
        ],
      ),
    );
  }
}
