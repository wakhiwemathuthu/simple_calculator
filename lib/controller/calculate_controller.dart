import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateController extends GetxController {
 
  var userInput = "";
  var userOutput = "";

  // Equal Button
  equalPressed() {
    if(userInput.isEmpty){

    }else{
    String userInputFC = userInput;
    userInputFC = userInputFC.replaceAll("x", "*");
    Parser p = Parser();
    Expression exp = p.parse(userInputFC);
    ContextModel ctx = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, ctx);

    userOutput = eval.toString();
    update();
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
    if(userInput.isEmpty){

    }else{
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