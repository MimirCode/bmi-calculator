import 'dart:math';

import 'package:flutter/services.dart';

class CalculatorBrain {
  CalculatorBrain({
    this.height,
    this.weight,
  });

  final int height;
  final int weight;

  double _bmi;
  double _pi;
  double _maxIdealWeight;
  double _minIdealWeight;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String calculateIdealWeight() {
    _minIdealWeight = ((18.5 * weight) / _bmi);
    _maxIdealWeight = ((24.9 * weight) / _bmi);
    return 'Your ideal weight is ${_minIdealWeight.toStringAsFixed(0)} ~ ${_maxIdealWeight.toStringAsFixed(0)}';
  }

  String calculatePI() {
    _pi = weight / pow(height / 100, 3);
    return _pi.toStringAsFixed(1);
  }

  String getBMIResult() {
    if (_bmi >= 30.0) {
      return 'Obese';
    } else if (_bmi <= 24.9 && _bmi >= 18.5) {
      return 'Normal';
    } else if (_bmi <= 29.9 && _bmi >= 25.0) {
      return 'Overweight';
    } else {
      return 'Underweight';
    }
  }

  String getBMIInterpretation() {
    if (_bmi >= 25) {
      return 'Your body weight is higher than normal.${calculateIdealWeight()}. It seems you should start doing more exercise.';
    } else if (_bmi >= 18) {
      return 'You have a normal body weight. ${calculateIdealWeight()}. keep it On!';
    } else {
      return 'Your body weight is lower than normal ${calculateIdealWeight()}.';
    }
  }
}
