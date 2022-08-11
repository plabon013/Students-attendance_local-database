import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_attendance/model/give_attendence_model.dart';
import 'package:student_attendance/pages/student_details_page.dart';
import 'package:student_attendance/pages/teacher_dashboard.dart';
import 'package:student_attendance/provider/give_attendence_provider.dart';
import 'package:student_attendance/provider/student_regi_provider.dart';
import 'package:intl/src/intl/date_format.dart';


class GiveAttendencePage extends StatefulWidget {
  static const String routeName = '/give_attendance';

  const GiveAttendencePage({Key? key}) : super(key: key);

  @override
  State<GiveAttendencePage> createState() => _GiveAttendencePageState();
}

class _GiveAttendencePageState extends State<GiveAttendencePage> {
  String date='';
  int aindex=0;
  String? SID;
  String? course;
  String? batch;
  String attendstatus='';
  String appbartext='Taking Attendence';
  String? teacher;
  int thisisnewdate=0;
  late String _dob;
  String? dateTime;
  late Size size;
  bool absent = false;
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;
  bool _value5 = false;
  late AttendenceProvider aprovider;
  List<String> AttendenceIDList =[];
  List<String?> currentattendenseid=[];

  void didChangeDependencies() {
    aprovider = Provider.of<AttendenceProvider>(context);
    //currentattendenseid=aprovider.attendencelist[0].id.toString().split(',');
    super.didChangeDependencies();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(appbartext),
        backgroundColor: Colors.blueGrey.shade800,
        elevation: 5,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Android', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            Text('Batch05', style: TextStyle(color: Colors.grey),),
            SizedBox(height: 5,),
            Center(
              child: Container(
                alignment: Alignment.center,
                height: size.height / 2,
                width: size.width /1.3,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade900,
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

                child: ListView(
                  children: [
                    CheckboxListTile(
                      title: const Text('Prioti'),
                      secondary: IconButton(
                        onPressed: (){
                          Navigator.pushNamed(context, StudentDetailsPage.routeName);
                        },
                        icon: Icon(Icons.person, size: 20,),
                      ),
                      autofocus: false,
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                      selected: _value1,
                      value: _value1,
                      onChanged: (value) {
                        setState(() {
                          _value1 = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Ornil'),
                      autofocus: false,
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                      secondary: IconButton(
                        onPressed: (){
                          Navigator.pushNamed(context, StudentDetailsPage.routeName);
                        },
                        icon: Icon(Icons.person,size: 20,),
                      ),
                      selected: _value2,
                      value: _value2,
                      onChanged: (value) {
                        setState(() {
                          _value2 = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Jui'),
                      autofocus: false,
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                      secondary: IconButton(
                        onPressed: (){
                          Navigator.pushNamed(context, StudentDetailsPage.routeName);
                        },
                        icon: Icon(Icons.person,size: 20,),
                      ),
                      selected: _value3,
                      value: _value3,
                      onChanged: (value) {
                        setState(() {
                          _value3 = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Humaira'),
                      autofocus: false,
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                      secondary: IconButton(
                        onPressed: (){
                          Navigator.pushNamed(context, StudentDetailsPage.routeName);
                        },
                        icon: Icon(Icons.person,size: 20,),
                      ),
                      selected: _value4,
                      value: _value4,
                      onChanged: (value) {
                        setState(() {
                          _value4 = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Mahi'),
                      autofocus: false,
                      activeColor: Colors.green,
                      checkColor: Colors.white,
                      secondary: IconButton(
                        onPressed: (){
                          Navigator.pushNamed(context, StudentDetailsPage.routeName);
                        },
                        icon: Icon(Icons.person,size: 20,),
                      ),
                      selected: _value5,
                      value: _value5,
                      onChanged: (value) {
                        setState(() {
                          _value5 = value!;
                        });
                      },
                    ),


                  ],
                ),

              ),
            ),
          ],
        ),
      )
      ,

      // body: Consumer<AddStudentProvider>(
      //   builder: (context, provider, _)=>ListView.builder(
      //     itemCount: provider.studentlist.length,
      //     itemBuilder: (context, int index){
      //       final students = provider.studentlist[index];
      //       return Dismissible(
      //         key: ValueKey(students.id),
      //         direction: DismissDirection.endToStart,
      //         onDismissed: (direction){
      //         },
      //         background: Container(
      //           color: Colors.red,
      //           child: const Icon(Icons.delete,color: Colors.white,),
      //         ),
      //         child: Container(
      //           height: 100,
      //           width: 100,
      //           color: Colors.blueGrey,
      //         ),
      //       );
      //     },
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /* if(aprovider.attendencelist.length<=0)
            {
              _saveAttendence();
            }
          for(int i=0;i<aprovider.attendencelist.length;i++)
          {
            if(selectedDate.toString()==aprovider.attendencelist[i].date)
            {
              aprovider.updateAttendence(aprovider.attendencelist[i].id, AttendenceIDList.toString());
              aindex=i-1;

            }
            else
              {
                thisisnewdate=1;
              }
          }
          if(thisisnewdate==1)
            {
              _saveAttendence();
            }*/
          Navigator.pushNamed(context, TeacherDashboard.routeName);
        },
        child: Icon(Icons.save),
        tooltip: 'Save Attendence',
      ),
    );
  }
  // void _saveAttendence() async {
  //   thisisnewdate=0;
  //   final attendence = AttendenceModel(
  //     // date: selectedDate.toString(),
  //     SIDs: AttendenceIDList.toString(),
  //     course: course,
  //     batch: batch,
  //     Status: attendstatus.toString(),
  //
  //   );
  //   print(attendence.toString());
  //   final status = await Provider
  //       .of<AttendenceProvider>(context, listen: false)
  //       .addAttendence(attendence);
  //   if(status){
  //     Navigator.pushNamed(context,TeacherDashboard.routeName);
  //   }
  // }
}
