//Write a dart program to print your name 10 times
void Name()
{
  String name="Karthik Thota";;
  for(int i=1; i<=10; i++)
  {
    print("My Name Is $name \n");
  }

}

// write a dart program to genarate multiplication tables of 5
void fifthtable() {
  int n = 5;
  print("Multiplication of 5th Table \n");

  for (int i = 1; i <= 10; i++) {
    print('$n * $i = ${n * i}');
  }
}
//write a dart progam to print 1 to 90 but not 55
void not55() {
  for (int i =1; i <= 90; i++) {
    if (i == 55)
      continue;
    print(i);
  }
}
//write a dart program to check wheather a character is a vowel or consonant
void vowelRconsonant()
{
  String text='Flutter is a Frame work ';
  String ch=text.toLowerCase();
  if ("aeiou".contains(ch))
  {
    print("$text is a vowels\n");
  }
  else
  {
    print("$text is a consonants \n");
  }

}
void main()
{
  Name();
  fifthtable();
  not55();
  vowelRconsonant();
}