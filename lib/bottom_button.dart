import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 10.0),
        color: KbottomContainerColour,
        height: kBottomContainerHeight,
        width: double.infinity,
        child: Text(
          buttonTitle,
          textAlign: TextAlign.center,
          style: kLargeButtomTextStyle,
        ),
      ),
    );
  }
}
