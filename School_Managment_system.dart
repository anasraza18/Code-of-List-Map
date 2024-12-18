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

//----------------------------------Search by Roll Number------------------------------------------------

   print("Enter Your Roll No :");

   String? input = stdin.readLineSync();
   int input2 = int.parse(input!);

   students.map((element) => element['roll_no'] == input2);
   var search_roll = students.firstWhere((element) => element['roll_no'] == input2);
   print('${search_roll}');
   print('');

//---------------------------------update Grades----------------------------------------------------
    

    print("Enter the roll no for update the grades");
    
    String? input3 = stdin.readLineSync();
    int input4 = int.parse(input3!);
     
     var std = students.firstWhere((e) => e['roll_no'] == input4);
    
    if(std != null){
      
      print("Enter the subject");
      String? input7 = stdin.readLineSync();

      print("Enter grades :");
      String? input5 = stdin.readLineSync();
      int input6 = int.parse(input5!);

      std['grades'][input7] = input6;

      print(std);

    }else{
      print("Not found");
    }
    print('');
    
  //---------------------------------------------------------------------
    
   }