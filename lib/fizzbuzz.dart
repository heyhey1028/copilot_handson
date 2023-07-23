import 'package:copilot_handson/util.dart';

/// a function that returns a string according to the following rules:
/// 1. If the number is divisible by 3, return "Fizz"
/// 2. If the number is divisible by 5, return "Buzz"
/// 3. If the number is divisible by 3 and 5, return "FizzBuzz"
/// 4. Otherwise, return the number as a string
///

String fizzBuzzFunction(int arg) {
  if (arg % 3 == 0 && arg % 5 == 0) {
    return callOutFizzBuzz();
  } else if (arg % 3 == 0) {
    return callOutFizz();
  } else if (arg % 5 == 0) {
    return callOutBuzz();
  } else {
    return arg.toString();
  }
}
