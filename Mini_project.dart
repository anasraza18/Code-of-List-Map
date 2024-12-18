
import 'dart:io';

void main(){

  List<dynamic> student = [

    {'name' : 'Anas', 'age' : 22},
    {'name' : 'Ali', 'age' : 12},
    {'name' : 'Ahmed', 'age' : 18, 'grade' : {'maths' : 88, 'eng' : 77, 'science' : 79}},
  ];

   student.forEach((element) {
    print('${element['age']}');
  });
  print('');

  //----------------------------check age == 19----------------------------------------------------------------
  
  if(student.any((element) => element['age']==19)){

  var age_19 = student.where((element) => element['age']==19);
  print(age_19);  

  }else{

    print("no such result found!");
  }
  print('');

//------------------------------check grade exist-----------------------------------------------------------------------------

  if(student.any((element)=> element.containsKey('grade'))){

    print('The Key "Grade" is exist');

  }else{

    print("Not exist");
  }
  print('');

//--------------------------------check maths subject-----------------------------------------------------

  var check = student.any((element)=> element.containsKey('grade') && element['grade'].containsKey('maths'));

  if(check){
    
    print("Maths is exist");

  }else{

    print("Maths is Not exists");
  }
  print('');

  //--------------------------------add a new map---------------------------------------------------------------------

  student.add({'name' : 'Saad', 'age' : 11, 'grade' : {'maths' : 76, 'science' : 78, 'eng' : 66}});

  print('Updated : ${student}');

  print('');

//-----------------------------------Filter older than 18--------------------------------------------------------------

  if(student.any((element) => element['age'] > 18)){

    var check2= student.where((element) => element['age'] > 18);
    print('Older than 18 : ${check2}');

  }else{

    print("no one older than 18");
  }
  print('');

  //-------------------------------sort a list by age in ascending order--------------------------------------------------------

   student.sort((a,b) => a['age'].compareTo(b['age']));
   print('Ascending order : ${student}');

   print('');

  //---------------------------------youngest student name------------------------------------------------------------

   var res = student.fold(student[0], (a,b) => a['age'] > b['age'] ? a : b);
  
   print('Youngest Student name is : ${res['name']}');
   print('');

//-----------------------------------grade key add with value if missing ---------------------------------------------------

  student.forEach((element) => element.putIfAbsent('grade' ,() => {'maths':66, 'phy':98, 'science':78}));
   print(student);
   print('');

//-----------------------------------add bonus point in grades-------------------------------------------------------------

   student.forEach((std) {
    std['grade'].updateAll((String subject,int marks) => marks + 5);
    });
   print('Add bonus point : ${student}');
   print('');

//---------------------------------find the student name in list of map by input--------------------------------------------------------------

   print("Enter the name :");
   String? input = stdin.readLineSync();
   
   if(student.any((element) => element['name'] == input)){
   var find = student.firstWhere((element) => element['name'] == input); 
    print("Details of $input are : $find");

   }else{

    print("Not found");
   }
   print('');

//---------------------------grade by formula----------------------------------------------------------

  student.forEach((grading) {

    var call_grades = grading['grade'].values;
    int total_no = call_grades.reduce((int a, int b) => a + b);
    double percentage = total_no / call_grades.length;

    String grade_to = '';

    if(percentage >= 90){
      grade_to = 'A+';

    }else if(percentage >= 80){
      grade_to = 'A';

    }else if(percentage >=70){
      grade_to = 'B';

    }else if(percentage >=60){
      grade_to = 'C';

    }else if(percentage >=50){
      grade_to = 'D';

    }else if(percentage >=40){
      grade_to = 'E';

    }else{
      grade_to = 'Fail';

    }

    grading['Per'] = percentage.toStringAsFixed(2);
    grading['Final_grade'] = grade_to;

  });

  student.forEach((result) {
    print('Name : ${result['name']}, Percentage : ${result['Per']}%, Final Grade : ${result['Final_grade']}');
  });

  //------------------------------------------------------------------------------------------

  
}