
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_attendance/model/teacher_regi-model.dart';
import 'package:student_attendance/pages/admin_dashboard.dart';
import 'package:student_attendance/pages/teacher_dashboard.dart';
import 'package:student_attendance/provider/teacherregi_provider.dart';

import 'admin_login.dart';
class TeacherLoginPage extends StatefulWidget {
  const TeacherLoginPage({Key? key}) : super(key: key);
  static const String routename='/teacherlogin';

  @override
  State<TeacherLoginPage> createState() => _TeacherLoginPageState();
}

class _TeacherLoginPageState extends State<TeacherLoginPage> {
  final emailController= TextEditingController();
  final passwordController= TextEditingController();
  late AddTeacherProvider provider;
  bool isObscure=true;
  void didChangeDependencies() {
    provider = Provider.of<AddTeacherProvider>(context);
    super.didChangeDependencies();
  }
late Size size;
 // List<AddTeacherModel> Teacherslist= provider.teacherlist;
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:  Text('Login As Trainer'),
        backgroundColor: Colors.blueGrey.shade800,
        elevation: 5,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: size.height * .2,
            child: Container(
              height: size.height * .5,
              width: size.width * .9,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45.withOpacity(.3),
                    spreadRadius: 10,
                    blurRadius: 15,
                    offset: Offset(0, 7),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                color: Colors.blueGrey.shade900,
              ),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 20, 16.0, 16.0),
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        labelStyle: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0,0.0,16.0, 20.0),
                    child: TextField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: isObsecure,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontSize: 12,
                          ),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                                isObsecure ? Icons.visibility_off : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                isObsecure = !isObsecure;
                              });
                            },
                          )),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: (){
                        // Navigator.pushNamed(context, AdminDashboard.routeName);  //for(int i=1;i<provider.teacherlist.length;i++)
                        //
                        //                         //if(emailController.text==provider.teacherlist[i].email)
                        //
                        //                            // print(provider.teachermaillist[i]);
                      Navigator.pushNamed(context, TeacherDashboard.routeName);
                      },
                      child: Text('Login'))
                ],
              ),
            ),
          ),

        ],

      ),
    );
  }
}
