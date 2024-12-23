import 'dart:io';

void main() {
  List<dynamic> students = [
    {
      'name': 'Anas',
      'age': 22,
      'roll_no': 022,
      'grades': {'Maths': 88, 'Science': 78, 'Eng': 89},
      'Attendance': {'totaldays': 30, 'presentdays': 24}
    },
    {
      'name': 'Ali',
      'age': 23,
      'roll_no': 034,
      'grades': {'Maths': 68, 'Science': 88, 'Eng': 79},
      'Attendance': {'totaldays': 30, 'presentdays': 20}
    },
    {
      'name': 'Zain',
      'age': 26,
      'roll_no': 021,
      'grades': {'Maths': 38, 'Science': 48, 'Eng': 59},
      'Attendance': {'totaldays': 30, 'presentdays': 14}
    }
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

  //--------------------percentage and Final grade-------------------------------------------------

   students.forEach((e) {

     var calling_grade = e['grades'].values;
     //double total = calling_grade.length;
     int sum = calling_grade.reduce((int a, int b) => a + b);
     double perc = sum / calling_grade.length;

     e['Percentage'] = perc.toStringAsFixed(2);
   });

   students.forEach((e) {
    print('Name : ${e['name']} , Percentage : ${e['Percentage']}%');
   });
   print('');

  //------------------------Delete the student by roll no---------------------------------------------------------------------

     String? inp = stdin.readLineSync();
     int rem = int.parse(inp!);

      students.removeWhere((e) => e['roll_no'] == rem);

     students.forEach((element) {
    print('${element}');
    print('');
   });

//--------------------------calculate perc of attendance & allowd only 70%---------------------------------------------------

  students.forEach((e) {
    var total_days = e['Attendance']['totaldays'];
    var present_days = e['Attendance']['presentdays'];
    double attend_perc = (present_days / total_days) * 100;

    e['Percentage of Attend'] = attend_perc.toStringAsFixed(2);

    if (attend_perc < 70) {
      print("${e['name']} is Not Allowed");
    } else {
      print("${e['name']} is Allowed");
    }
    print('');
  });
  print('');

  //------------------------------------------------------------------------
}
