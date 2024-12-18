import 'dart:io';
void main(){

  List<dynamic> students = [

    {'name' : 'Anas', 'age' : 22, 'roll_no' : 022, 'grades' : {'Maths' : 88, 'Science' : 78, 'Eng' : 89}},
    {'name' : 'Ali', 'age' : 23, 'roll_no' : 034, 'grades' : {'Maths' : 68, 'Science' : 88, 'Eng' : 79}},
    {'name' : 'Zain', 'age' : 26, 'roll_no' : 021, 'grades' : {'Maths' : 38, 'Science' : 48, 'Eng' : 59}}
  ];
   students.forEach((element) {
    print('${element}');
    print('');
   });

//----------------------------------------------------------------------------------

   print("Enter Your Roll No :");

   String? input = stdin.readLineSync();
   int input2 = int.parse(input!);

   students.where((element) => element['roll_no'] == input2);
   var search_roll = students.firstWhere((element) => element['roll_no'] == input2);
   print('${search_roll}');
   
}