import 'dart:io';


//                ************  Main Function  ***************
void main() {
  Calculator();
  Prime_Num();
  Factorial_num();
  Fibonacci();
  Sort_Search_Reverse();
  Map_();
  Exception_Handling();
  Final_Const();

}

//             *************** Calculator   ******************
void Calculator() {
  print("Enter first number:");
  double a = double.parse(stdin.readLineSync()!);

  print("Enter second number:");
  double b = double.parse(stdin.readLineSync()!);

  print("Choose operation (+, -, *,%, /):");
  String op = stdin.readLineSync()!;

  double result;

  switch (op) {
    case '+':
      result = a + b;
      break;
    case '-':
      result = a - b;
      break;
    case '*':
      result = a * b;
      break;
    case '%':
      result = a % b;
      break;
    case '/':
      result = a / b;
      break;

    default:
      print("Invalid operation");
      return;
  }

  print("Result: $result");
}

//                 ****************** Prime_Number ************
void Prime_Num() {
  print('Enter a number: ');
  int num = int.parse(stdin.readLineSync()!);
  bool isPrime = true;

  for (int i = 2; i <= num ~/ 2; i++) {
    if (num % i == 0) {
      isPrime = false;
      break;
    }
  }

  print('$num is ${isPrime ? "a Prime" : "not a Prime"} number');
}

//                    ******************* Factorial **************
void Factorial_num() {
  print("Enter a Number");
  int Number = int.parse(stdin.readLineSync()!);

  int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);

  }
  int result = factorial(Number);
  print("Factorial of $Number is $result");
}


//                   ******************* Fibonacci Series **************

void Fibonacci() {
  print("Enter a Number");
  int n = int.parse(stdin.readLineSync()!);
  int a = 0,
      b = 1;

  print("Fibonacci Series up to $n terms:");
  for (int i = 0; i < n; i++) {
    print('$a');
    int next = a + b;
    a = b;
    b = next;
  }
}

//                        ****************** Sort , Search, Reverse *********************

void Sort_Search_Reverse() 
{

  List<int> numbers = [5, 3, 8, 1, 9];

  print("Original List: $numbers");

  numbers.sort();
  print("Sorted List: $numbers");

  numbers = numbers.reversed.toList();
  print("Reversed List: $numbers");

  int search = 3;
  print("Does list contain $search? ${numbers.contains(search)}");
}

//                  *************** Maps *****************
void Map_() {
  Map<String, String> countries = {
    'IN': 'India',
    'US': 'United States',
    'JP': 'Japan'
  };

  String code = 'IN';
  print('Country for code $code is ${countries[code]}');
}

//                      ***************** Exception Handling ******************
void Exception_Handling() {
  try {
    int a = 5, b = 0;
    int result = a ~/ b;
    print("Result: $result");
  } catch (e) {
    print("Caught an exception: $e");
  }
}

//                ***************** Final & Const *************************
void Final_Const() {
  final currentTime = DateTime.now();
  const gravity = 9.8;

  print("Current Time: $currentTime");
  print("Gravity: $gravity");
}

