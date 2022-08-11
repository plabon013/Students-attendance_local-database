import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:student_attendance/pages/add-batch_page.dart';
import 'package:student_attendance/pages/add_courses.dart';
import 'package:student_attendance/pages/course_list_page.dart';
import 'package:student_attendance/pages/student_registration.dart';
import 'package:student_attendance/pages/students_list_page.dart';
import 'package:student_attendance/pages/teacher_registration.dart';
import 'package:student_attendance/pages/trainer_list_page.dart';

class AdminDashboard extends StatefulWidget {
  static const String routeName = '/admin_dashboard';

  const AdminDashboard({Key? key}) : super(key: key);

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  late Size size;
  double height = 0;
  bool open = false;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.blueGrey.shade800,
        elevation: 10,
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () {
                        // setLoginStatus(false).then((value) => Navigator.pushReplacementNamed(context, LoginPage.routeName));
                      },
                      child: const Text('Logout'),
                    ),
                  ])
        ],
      ),
      body: Stack(alignment: Alignment.center,

          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Positioned(
              top: size.height / 16,
              child: Column(
                children: [
                  Card(
                      shape: CircleBorder(
                          side: BorderSide(
                        color: Colors.amber,
                        width: 2.0,
                      )),
                      elevation: 5,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('images/admin2.jpg'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Mr.Hanif',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Admin',
                    style: TextStyle(fontSize: 12, color: Colors.amberAccent),
                  ),
                  // SizedBox(height: ,),
                  Lottie.asset('assets/ball-loader.json',
                      height: 80, width: 80),
                ],
              ),
            ),

            Center(
                child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: size.height * .45,
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
                      // color: Colors.grey.shade800,
                      color: Colors.blueGrey.shade900,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blueGrey.shade800,
                                  onPrimary: Colors.white,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.all(20),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AddBatch.routename);
                                },
                                child: FittedBox(
                                    child: Center(
                                        child: const Text('Add Batch')))),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blueGrey.shade800,
                                  onPrimary: Colors.white,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.all(20),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, AddCourses.routename);
                                },
                                child: FittedBox(
                                    child: Center(
                                        child: const Text('Add Course')))),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // SizedBox(width: 20,height: 40),
                        Column(
                          children: [
                            // SizedBox(height: 50,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueGrey.shade800,
                                      onPrimary: Colors.amberAccent,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.all(20),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          TeacherRegistrationForm.routeName);
                                    },
                                    child: FittedBox(
                                        child: Center(
                                            child: const Text('Add Trainer')))),
                                SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.blueGrey.shade800,
                                      onPrimary: Colors.amberAccent,
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.all(20),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          StudentRegistrationForm.routeName);
                                    },
                                    child: FittedBox(
                                        child: Center(
                                            child: const Text('Add Student')))),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blueGrey.shade800,
                                  onPrimary: Colors.white,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.only(
                                      top: 20, left: 20, right: 20, bottom: 20),
                                ),
                                onPressed: () {
                                  setState(() {
                                    open ? height = 00 : height = 90;
                                    open = !open;
                                  });
                                },
                                child: FittedBox(
                                    child: Center(
                                        child: const Text('All Control')))),
                          ],
                        ),
                        // SizedBox(height: 20),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                height: height,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey.shade800,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45.withOpacity(.3),
                                      spreadRadius: 5,
                                      blurRadius: 15,
                                    ),
                                  ],
                                ),
                                child: ListView(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              elevation: 3,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              primary: Colors.blue,
                                              // padding: const EdgeInsets.fromLTRB(22, 20, 22, 20)
                                            ),
                                            onPressed: () {
                                              Navigator.pushNamed(context,
                                                  StudentsListPage.routename);
                                            },
                                            child: FittedBox(
                                                child: Center(
                                                    child: Text('Students')))),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              elevation: 3,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              primary: Colors.green,
                                              // padding: const EdgeInsets.fromLTRB(22, 20, 22, 20),
                                            ),
                                            onPressed: () {
                                              Navigator.pushNamed(context,
                                                  TrainerListPage.routename);
                                            },
                                            child: FittedBox(
                                                child: Center(
                                                    child: Text('Trainers')))),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                      // width: 20,
                                    ),
                                    Column(
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              elevation: 3,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                              primary: Colors.deepPurple,
                                              // padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                                            ),
                                            onPressed: () {
                                              Navigator.pushNamed(context,
                                                  CourseListPage.routename);
                                            },
                                            child: FittedBox(
                                                child: Center(
                                                    child: Text('Courses')))),
                                      ],
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )

                // ],
                ),
            // )
          ]),
    );
  }
}
