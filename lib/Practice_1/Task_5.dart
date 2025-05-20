//Create a list of names and print all names using list.
import 'dart:io';
void list() {
  List names = ['Prudhvi', 'Chandu', 'Sasi', 'Pandu', 'Sai'];
  print("List of Names Below: ");

  names.forEach((name) => print("$name " ) );
  print("\n");
}

//Create a set of fruits and print all fruits using loop.
void set() {
  Set fruits = {'Apple', 'Banana', 'Orange', 'Mango', 'Grapes'};
  print("Set of Fruits below: ");

  fruits.forEach((fruit) => print("$fruit ") );
  print("\n");
}

//Create a program that reads list of expenses amount using user input and print total.

void expenses() {
  print('Enter number of expenses:');
  int n = int.parse(stdin.readLineSync()!);
  double total = 0;
  for (int i = 0; i < n; i++) {
    print('Enter expense ${i + 1}:');
    total += double.parse(stdin.readLineSync()!);
  }

  print('Total Expenses: \$${total.toStringAsFixed(2)}');
  print("\n");
}


//Create an empty list of type string called days. Use the add method to add names of 7 days and print all days.
void addmethod() {
  List days = [];

  days.add('Monday');
  days.add('Tuesday');
  days.add('Wednesday');
  days.add('Thursday');
  days.add('Friday');
  days.add('Saturday');
  days.add('Sunday');
  print('Days of the Week:');
  for (String day in days) {
    print(day);
  }
  print("\n");
}

//Add your 7 friend names to the list. Use where to find a name that starts with alphabet a
void alphabet() {
  List friends = ['Arjun', 'Santosh', 'Marco', 'Sara', 'Arvind', 'Vicky', 'Ayesha'];

  print('Names starting with A:');
  for (String name in friends) {
    if (name.toLowerCase().startsWith('a')) {
      print(name);

    }
  }
  print("\n");
}



void main()
{
  list();
  set();
  expenses();
  addmethod();
  alphabet();
}