import 'package:flutter/material.dart';
import 'package:student_attendance/model/add_course_model.dart';
import 'package:student_attendance/pages/admin_dashboard.dart';
import 'package:student_attendance/provider/add_course_provider.dart';
import 'package:provider/provider.dart';

class AddCourses extends StatefulWidget {
  const AddCourses({Key? key}) : super(key: key);
  static const String routename='/addCourse';

  State<AddCourses> createState() => _AddCoursesState();
}

class _AddCoursesState extends State<AddCourses> {
  final courseaddingController= TextEditingController();
  late AddCourseProvider courseprovider;
  late int totalcourses;
  late Size size;

  @override void dispose() {
    courseaddingController.dispose();
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    courseprovider = Provider.of<AddCourseProvider>(context);
    totalcourses=courseprovider.courselist.length;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Courses'),
        backgroundColor: Colors.blueGrey.shade800,
        elevation: 10,
      ),
      body: Center(
        child: Container(
          height: size.height / 1.5,
          width: size.width / 1.5,
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade800,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black45.withOpacity(.3),
                spreadRadius: 10,
                blurRadius: 15,
                offset: Offset(0, 7),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$totalcourses Course Added'),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: courseaddingController,
                    decoration: InputDecoration(
                        labelText: 'Add',
                        prefixIcon: Icon(Icons.book)
                    ),

                  ),
                ),
              SizedBox(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(18),
                  ),
                  onPressed:(){ _saveCourse();}
                  , child: const Text('Add Course')),
            ],

          ),
        ),
      ),
    );
  }
  void _saveCourse() async {
      final course = AddCourseModel(
          name:courseaddingController.text,
      );
      print(course.toString());
      final status = await Provider
          .of<AddCourseProvider>(context, listen: false)
          .addNewCourse(course);
      if(status){
        Navigator.pushNamed(context, AdminDashboard.routeName);
    }
  }
}
