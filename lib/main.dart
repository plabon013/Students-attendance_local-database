import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:student_attendance/pages/add-batch_page.dart';
import 'package:student_attendance/pages/add_courses.dart';
import 'package:student_attendance/pages/admin_dashboard.dart';
import 'package:student_attendance/pages/admin_login.dart';
import 'package:student_attendance/pages/course_list_page.dart';
import 'package:student_attendance/pages/first_page.dart';
import 'package:student_attendance/pages/give_attendence_page.dart';
import 'package:student_attendance/pages/home_page.dart';
import 'package:student_attendance/pages/student_details_page.dart';
import 'package:student_attendance/pages/student_registration.dart';
import 'package:student_attendance/pages/students_list_page.dart';
import 'package:student_attendance/pages/teacher_dashboard.dart';
import 'package:student_attendance/pages/teacher_login.dart';
import 'package:student_attendance/pages/teacher_registration.dart';
import 'package:student_attendance/pages/trainer_list_page.dart';
import 'package:student_attendance/provider/add_batch_provider.dart';
import 'package:student_attendance/provider/add_course_provider.dart';
import 'package:student_attendance/provider/give_attendence_provider.dart';
import 'package:student_attendance/provider/student_regi_provider.dart';
import 'package:student_attendance/provider/teacherregi_provider.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AddCourseProvider()..getallCourse()),
    ChangeNotifierProvider(create: (context)=> AddTeacherProvider()..getAllTeacher()),
    ChangeNotifierProvider(create: (context)=> AddStudentProvider()..getallStudent()),
    ChangeNotifierProvider(create:(context)=> AttendenceProvider()..getAllAttendence()),
    ChangeNotifierProvider(create: (context)=>AddBatchProvider()..getallBatch())
  ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(

        // primarySwatch: Colors.blue,
      ),
      initialRoute:HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        FirstPage.routeName : (context) => FirstPage(),
        AdminDashboard.routeName : (context) => AdminDashboard(),
        TeacherDashboard.routeName: (context) => TeacherDashboard(),
        TeacherRegistrationForm.routeName: (context) => TeacherRegistrationForm(),
        StudentRegistrationForm.routeName: (context) => StudentRegistrationForm(),
        LoginPage.routename: (context)=> LoginPage(),
        TeacherLoginPage.routename:(context)=> TeacherLoginPage(),
        AddCourses.routename:(context)=> AddCourses(),
        AddBatch.routename:(context)=> AddBatch(),
        // GiveAttendencePage.routename:(context)=> GiveAttendencePage(),
        StudentsListPage.routename:(context)=>StudentsListPage(),
        TrainerListPage.routename:(context)=>TrainerListPage(),
        CourseListPage.routename:(context)=>CourseListPage(),
        GiveAttendencePage.routeName:(context) => GiveAttendencePage(),
        StudentDetailsPage.routeName:(context) => StudentDetailsPage(),
      },
    );
  }
}



