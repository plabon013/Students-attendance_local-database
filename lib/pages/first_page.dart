import 'package:flutter/material.dart';
import 'package:student_attendance/pages/admin_login.dart';
import 'package:student_attendance/pages/teacher_dashboard.dart';
import 'package:student_attendance/pages/teacher_login.dart';

import 'admin_dashboard.dart';

class FirstPage extends StatefulWidget {
  static const String routeName = '/';
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}
late Size size;
class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choosing Role'),
        backgroundColor: Colors.blueGrey.shade800,
        elevation: 5,
      ),
      body:
      Container(
      decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('images/back.gif'),
    fit: BoxFit.cover,
    )
    ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Image.asset('images/admin.png', height: 100, width: 100,),
                  SizedBox(height: 8,),

                  ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(context,
                            LoginPage.routename);
                      },
                      child: const Text('Admin')),
                ],
              ),
            ),
            SizedBox(width: 20,),
            Container(
              child: Center(
                child: Column(
                  children: [
                    Image.asset('images/teacher.png', height: 100, width: 100,),
                    SizedBox(height: 8,),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context,
                              TeacherLoginPage.routename);
                        },
                        child: const Text('Teacher')),
                  ],
                ),
              ),
            ),

          ],
        ),
  ],
      ),
    )
    );
  }
}
