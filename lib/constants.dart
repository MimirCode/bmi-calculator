import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kBottomContainerHeight = 80.0;
const KbottomContainerColour = Color(0xFF455A64);
const kActiveCardColour = Colors.blueGrey;
const kInactiveCardColour = Color(0xFF90a4ae);

//Text Styles
const kLabelTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 35.0,
  color: Color(0xFF1D1E33),
  shadows: [
    // BoxShadow(
    //   color: Colors.blueGrey,
    //   offset: Offset(0, 3),
    //   blurRadius: 6,
    // )
  ],
);

const kNumberTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  letterSpacing: 3.0,
  shadows: [
    BoxShadow(
      color: Colors.blueGrey,
      offset: Offset(0, 3),
      blurRadius: 6,
    )
  ],
);

const kLargeButtomTextStyle = TextStyle(
  color: Color(0xff90a4ea),
  fontSize: 35.0,
  letterSpacing: 3.0,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w900,
  shadows: [
    BoxShadow(
      color: Color(0xff263238),
      offset: Offset(0, 3),
      blurRadius: 6,
    )
  ],
);

const kTitleStyle = TextStyle(
  fontSize: 45.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Baloo2',
  color: Color(0xFF1D1E33),
);

const kResultTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w900,
  fontFamily: 'Montserrat',
  color: Color(0xff1b5e20),
);
const kBMIResultTextStyle = TextStyle(
  fontSize: 25.0,
  fontFamily: 'Baloo2',
  color: Color(0xff1b5e20),
);
