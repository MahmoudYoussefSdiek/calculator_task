import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider extends ChangeNotifier {
  String _firstNumber = '0';
  String _secondNumber = '0';
  String _input = '0';
  String _output = '0';
  String _operator = '';
  bool _secondNumberFlag = false;

  String get firstNumber => _firstNumber;
  String get secondNumber => _secondNumber;
  String get input => _input;
  String get output => _output;
  String get operator => _operator;
  bool get flag => _secondNumberFlag;

  set firstNumber(String value) {
    if (_firstNumber == '0') {
      _firstNumber = value;
    } else {
      _firstNumber += value;
    }
    notifyListeners();
  }

  set secondNumber(String value) {
    if (_secondNumber == '0') {
      _secondNumber = value;
    } else {
      _secondNumber += value;
    }
    notifyListeners();
  }

  set operator(String value) {
    _operator = value;
    notifyListeners();
  }

  set input(String value) {
    if (_input == '0') {
      _input = value;
    } else {
      _input += value;
    }
    notifyListeners();
  }

  // set output(String value) {
  //   if (_output == '0') {
  //     _output = value;
  //   } else {
  //     _output += value;
  //   }
  //   notifyListeners();
  // }

  set secondNumberFlag(bool value) {
    _secondNumberFlag = value;
    notifyListeners();
  }

  operation() {
    if (operator == '%') {
    } else if (operator == '/') {
      _input += ' / ';
    } else if (operator == '*') {
      _input += ' * ';
    } else if (operator == '+') {
      _input += ' + ';
    } else if (operator == '-') {
      _input += ' - ';
    } else if (operator == 'C') {
      _input = '0';
      _output = '0';
      _firstNumber = '0';
      _secondNumber = '0';
    } else if (operator == 'DEL') {
      _input = _input.substring(0, _input.length - 1);
    } else if (operator == '=') {
      var exp = Parser().parse(_input);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      _output = evaluation.toString();
      if (_output.endsWith('.0')) {
        _output = _output.replaceAll('.0', '');
      }
      notifyListeners();
    }
  }
}
