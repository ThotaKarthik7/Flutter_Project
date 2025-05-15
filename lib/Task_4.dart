//Write a program in dart to print you own name using function
import 'dart:math';
void Name()
{
  String name="Karthik Thota";;
  print("My Name Is $name \n");

}
//wirte a program in dart that generate random password

String generatePassword(int length) {
  String lowercase = 'abcdefghijklmnopqrstuvwxyz';
  String uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  String numbers = '0123456789';
  String symbols = '@#\$%&*';

  String allChars = lowercase + uppercase + numbers + symbols;

  Random random = Random();
  String password = '';

  for (int i = 0; i < length; i++) {
    password += allChars[random.nextInt(allChars.length)];
  }

  return password;
}


//wirte a program in dart calculate area of a cricle using function

void calculateArea(double radius) {
  double area = pi * radius * radius;
  print('Area of the circle with radius $radius is $area \n');
}


void main()
{
  Name();
  calculateArea(7);
  print('Generated Password: ${generatePassword(8)}');

}
