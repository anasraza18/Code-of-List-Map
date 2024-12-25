import 'dart:io';

void main() {
  List<dynamic> students = [
    {
      'name': 'Anas',
      'age': 22,
      'roll_no': 022,
      'grades': {'Maths': 88, 'Science': 78, 'Eng': 89},
      'Attendance': {'totaldays': 30, 'presentdays': 24},
      'Activities': ['debates', 'sports', 'art'],
    },
    {
      'name': 'Ali',
      'age': 23,
      'roll_no': 034,
      'grades': {'Maths': 68, 'Science': 88, 'Eng': 9},
      'Attendance': {'totaldays': 30, 'presentdays': 20}
    },
    {
      'name': 'Zain',
      'age': 26,
      'roll_no': 021,
      'grades': {'Maths': 38, 'Science': 48, 'Eng': 59},
      'Attendance': {'totaldays': 30, 'presentdays': 14}
    },
    {
      'name': 'Zain',
      'age': 26,
      'roll_no': 025,
      'grades': {'Maths': 48, 'Science': 49, 'Eng': 79},
      'Attendance': {'totaldays': 30, 'presentdays': 24}
    },
    {
      'name': 'sam',
      'age': 16,
      'roll_no': 026,
      'grades': {'Maths': 18, 'Science': 88, 'Eng': 55},
      'Attendance': {'totaldays': 30, 'presentdays': 26}
    },
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

// //---------------------------------update Grades----------------------------------------------------

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

//   //--------------------percentage and Final grade-------------------------------------------------

  students.forEach((e) {
    var calling_grade = e['grades'].values;
    //double total = calling_grade.length;
    int sum = calling_grade.reduce((int a, int b) => a + b);
    double perc = sum / calling_grade.length;

    String grad = '';
    if (perc >= 90) {
      grad = 'A+1';
    } else if (perc >= 80) {
      grad = 'A';
    } else if (perc >= 70) {
      grad = 'B';
    } else if (perc >= 60) {
      grad = 'C';
    } else if (perc >= 50) {
      grad = 'D';
    } else if (perc >= 40) {
      grad = 'E';
    } else {
      grad = 'Fail';
    }

    String report = '';
    if (grad == 'Fail') {
      report = 'Fail';
    } else {
      report = 'Pass';
    }

    e['Total_Number'] = sum;
    e['Report'] = report;
    e['Final_Grade'] = grad;
    e['Percentage'] = perc.toStringAsFixed(2);
  });

  students.forEach((e) {
    print(
        'Name : ${e['name']} , Percentage : ${e['Percentage']}% , Final_grade : ${e['Final_Grade']}, Report : ${e['Report']}');
  });
  print('');

//   //------------------------Delete the student by roll no---------------------------------------------------------------------

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

  // //--------------------------report card----------------------------------------------

   students.forEach((e) {

    print("Name : ${e['name']}, Roll_No : ${e['roll_no']}, Grades of All Sub : ${e['grades']}, Final_grade : ${e['Final_Grade']}, Attendance : ${e['Percentage of Attend']}%, Final_Result : ${e['Report']}");
   print('');
   });

  //---------------------------------Count Students by Age Group--------------------------------------------------

  students.forEach((e) {
    String rang = '';
    if (e['age'] >= 15 && e['age'] <= 18) {
      rang = 'The age of 15-18 is:';
    } else if (e['age'] >= 19 && e['age'] <= 22) {
      rang = 'The age of 19-22 is:';
    } else if (e['age'] >= 23) {
      rang = 'The age of 23+ is:';
    }
    e['Range'] = rang;
  });

  students.forEach((e) {
    print('${e['Range']} ${e['name']}');
    print('');
  });
  print('');

  //--------------------------Assign Extra-Curricular Activities-------------------------------------------

  students.forEach((e) {
    if (e['Total_Number'] > 250) {
      print('${e['name']} gets sports');
    } else {
      print('${e['name']} gets art');
    }
    print('');
  });
  print('');
//------------------------------Promote Students----------------------------------------------

  students.forEach((e) {
    double attendancePercentage =
        double.tryParse(e['Percentage of Attend'].toString()) ?? 0.0;

    if (e['Total_Number'] >= 200 && attendancePercentage >= 80) {
      print("${e['name']} is eligible for pormotion");
    } else {
      print("${e['name']} is Not Eligible");
    }
    print('');
  });
  print('');

  //-----------------------Find Top 3 Performers------------------------------------------------

  students.sort((a, b) => b['Total_Number'].compareTo(a['Total_Number']));
  var top3 = students.take(3);

  top3.forEach((e) {
    print("${e['name']} got ${e['Total_Number']} marks.");
    print('');
  });
  print('');

//------------------------- Find Subjects with Lowest Average-------------------------------------------------------------------------

Map all_grades = {'maths_grades' : [], 'science_grades' : [], 'eng_grades' : []};

students.forEach((e) {
    
    var m = e['grades']['Maths'];
    all_grades['maths_grades'].add(m);

  });

  students.forEach((e) {

    var s = e['grades']['Science'];
    all_grades['science_grades'].add(s);

  });

  students.forEach((e) {

    var en = e['grades']['Eng'];
    all_grades['eng_grades'].add(en);
  });

  int sum_m = all_grades['maths_grades'].reduce((a,b) => a + b);
  double avg_m = sum_m / all_grades['maths_grades'].length;
  print('Avg_maths : ${avg_m}');
  print('');

  int sum_s = all_grades['science_grades'].reduce((a,b) => a + b);
  double avg_s = sum_s / all_grades['science_grades'].length;
  print('Avg_science : ${avg_s}');
  print('');
  
  int sum_e = all_grades['eng_grades'].reduce((a,b) => a + b);
  double avg_e = (sum_e / all_grades['eng_grades'].length);
  print('Avg_eng : ${avg_e}');
  print('');

  Map All_avg = {'Maths_avg' : avg_m , 'Science_avg' : avg_s, 'Eng_avg' : avg_e}; 
  students.add({'All_avg' : All_avg});
  print('${students}');
  print('');


     String Lowest_avg = All_avg.entries.reduce((a,b)=> a.value < b.value ? a:b).key;
     double Lowest_avg1 = All_avg.entries.reduce((a,b)=> a.value < b.value ? a:b).value;
     print("Lowest Avg Subject is ${Lowest_avg} = ${Lowest_avg1}");
     print('');

//---------------------------------------------------------------------------------------------


}
