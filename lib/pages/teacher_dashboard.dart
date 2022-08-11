import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_attendance/pages/give_attendence_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:animations/animations.dart';
import 'package:lottie/lottie.dart';
import '../widget/card_widget.dart';
import '../widget/custom_fav_widget.dart';
import 'details_page.dart';
import 'give_attendence_page.dart';

class TeacherDashboard extends StatefulWidget {
  static const String routeName = '/teacher_dashboard';

  const TeacherDashboard({Key? key}) : super(key: key);

  @override
  State<TeacherDashboard> createState() => _TeacherDashboardState();
}

late Size size;
double height_first = 0.0;
double width_first = 0.0;

class _TeacherDashboardState extends State<TeacherDashboard> {
  List<String> courses_list = [
    'Course',
    'Android',
    'PHP',
    'Flutter',
    'Cyber Sequrity',
  ];
  List<String> batches_list = [
    'Batch',
    'Batch-01',
    'Batch-02',
    'Batch-03',
  ];
  late String _dob;
   late String courses;
  late String batches;
  void _selectDate() async {
    final selecedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (selecedDate != null) {
      setState(() {});
      _dob = DateFormat('dd/MM/yyyy').format(selecedDate);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    _dob = DateFormat('dd/MM/yyyy').format(DateTime.now());
     courses=courses_list[0];
     batches=batches_list[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final transitionType = ContainerTransitionType.fade;
    size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: CustomFABWidget(transitionType: transitionType),
      appBar: AppBar(
        title: const Text('Teacher Dashboard'),
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
      body: Stack(
        alignment: Alignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Positioned(
            top: size.height / 16,
            // right: size.width / 3,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
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
                          image: AssetImage('images/teacher2.jpg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Mrs Lous',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 05,
                ),
                Text(
                  'Asst Professor',
                  style: TextStyle(fontSize: 12, color: Colors.amberAccent),
                ),
                // Lottie.asset('assets/ball-loader.json',height: 80,width: 80),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [

                Positioned(
                  top: size.height * .4,
                  // left: size.width * .05,
                  child: Container(
                    height: size.height * .5,
                    width: size.width * .9,
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45.withOpacity(.3),
                          spreadRadius: 10,
                          blurRadius: 15,
                          offset: Offset(0, 7),
                        ),
                      ],
                      color: Colors.blueGrey.shade900,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),

                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset('assets/ball-loader.json',height: 50,width: 50),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top:0.0, right: 16.0, left: 16.0,
                                ),
                                child: Container(
                                  width: size.width/1.2,
                                  height: size.height / 16,
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45.withOpacity(.3),
                                      spreadRadius: 10,
                                      blurRadius: 15,
                                      offset: Offset(0, 7),
                                    ),
                                  ],
                                    color: Colors.blueGrey.shade800,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButton(
                                      isExpanded: true,
                                      underline:Container(),
                                      // Initial Value
                                      value: courses,
                                      // Down Arrow Icon
                                      icon: const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: courses_list.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: new Text(items),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          courses = newValue!;
                                        });
                                      },
                                      hint: Text('Course'),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16,left: 16, right: 16,bottom: 8),
                                child: Container(
                                  width: size.width/1.2,
                                  height: size.height / 16,
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45.withOpacity(.3),
                                      spreadRadius: 10,
                                      blurRadius: 15,
                                      offset: Offset(0, 7),
                                    ),
                                  ],
                                    color: Colors.blueGrey.shade800,
                                    borderRadius: BorderRadius.circular(10),
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButton(
                                      isExpanded: true,
                                      underline:Container(),
                                      // Initial Value
                                      value: batches,

                                      // Down Arrow Icon
                                      icon: const Icon(Icons.keyboard_arrow_down),

                                      // Array list of items
                                      items: batches_list.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: new Text(items),
                                        );
                                      }).toList(),
                                      // After selecting the desired option,it will
                                      // change button value to selected value
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          batches = newValue!;
                                        });
                                      },
                                      hint: Text('Batch'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            color: Colors.blueAccent.shade700.withOpacity(.2),
                            elevation: 5,
                            child:Padding(
                              padding: EdgeInsets.only(top:8, bottom: 8, left: 80, right: 80),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: TextButton(
                                      onPressed: _selectDate,
                                      child:Icon(Icons.calendar_month),
                                    ),
                                  ),
                                  Text(_dob),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Center(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blueGrey.shade800,
                                  onPrimary: Colors.amberAccent,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.all(20),
                                ),
                                onPressed: (){
                                  // Navigator.pushNamed(
                                  //     context, GiveAttendencePage.routename, arguments: selectedDate);
                                  Navigator.pushNamed(context, GiveAttendencePage.routeName);
                                },
                                child: const Text('Give Attendence')),
                          ),

                        ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
