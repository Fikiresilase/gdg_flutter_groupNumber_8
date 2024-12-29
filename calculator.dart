import 'dart:io';
import 'dart:async';

void main() {
  var calculator = Calculator();
  calculator.display();
}

class Calculator {
  dynamic result = 0;
  String currentOperation = '';
  var operator;

  Future<void> selectOperator(var num) async {
    print('CHOOSE AN OPERATION');
    print('1. ADD  2. SUBTRACT 3. MULTIPLY 4. DIVIDE 5. TERMINATE');
    this.operator = stdin.readLineSync();

    switch (this.operator) {
      case '1':
        add(num);
        currentOperation += '$num + ';
        print(currentOperation);
        break;
      case '2':
        sub(num);
        currentOperation += '$num - ';
        print(currentOperation);
        break;
      case '3':
        mult(num);
        currentOperation += '$num * ';
        print(currentOperation);
        break;
      case '4':
        div(num);
        currentOperation += '$num / ';
        print(currentOperation);
        break;
      case '5':
        print('Finalizing calculations...');
        await Future.delayed(Duration(seconds: 5));
        print('Result: $result');
        exit(0);
      case null:
        print('No operation selected. Exiting...');
        exit(0); 
      default:
        print('WRONG INPUT');
        break;
    }
  }

  dynamic inputNumber() {
    print('INPUT A NUMBER');
    var numberInput = stdin.readLineSync();
    if (numberInput == null) {
      print('No input provided. Exiting...');
      exit(0);
    }
    if (!validate(numberInput)) {
      return inputNumber(); 
    }
    return int.parse(numberInput);
  }

  bool validate(dynamic input) {
    if (int.tryParse(input) == null) {
      print('WRONG INPUT');
      return false;
    }
    return true;
  }

  void add(var num) {
    result += num;
  }

  void sub(var num) {
    result -= num;
  }

  void mult(var num) {
    result *= num;
  }

  void div(var num) {
    if (num == 0) {
      print('Division by zero is not allowed!');
    } else {
      result /= num;
    }
  }

  Future<void> display() async {
    while (true) {
      var num = inputNumber();
      await selectOperator(num);
    }
  }

  Calculator();
}
