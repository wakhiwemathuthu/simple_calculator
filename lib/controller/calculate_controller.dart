import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateController extends GetxController {
  var userInput = "";
  var userOutput = "";

  // Equal Button
  equalPressed() {
    try {
      String userInputFC = userInput;
      userInputFC = userInputFC.replaceAll("x", "*");
      Parser p = Parser();
      Expression exp = p.parse(userInputFC);
      ContextModel ctx = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, ctx);
      userOutput = eval.toString();
      update();
    } catch (error) {
      Fluttertoast.showToast(
          msg: "$error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  // Clear Button
  clearInputAndOutput() {
    userInput = "";
    userOutput = "";
    update();
  }

  // Delet Button
  deleteBtnAction() {
    if (userInput.isEmpty) {
    } else {
      userInput = userInput.substring(0, userInput.length - 1);
      update();
    }
  }

  // Number Button
  onBtnTapped(List<String> buttons, int index) {
    userInput += buttons[index];
    update();
  }
}
