import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_attendance/model/add_course_model.dart';
import 'package:student_attendance/model/student_regi_model.dart';
import 'package:student_attendance/pages/admin_dashboard.dart';
import 'package:student_attendance/provider/add_batch_provider.dart';
import 'package:student_attendance/provider/add_course_provider.dart';
import 'package:provider/provider.dart';
import 'package:student_attendance/provider/student_regi_provider.dart';
import 'package:toast/toast.dart';

import '../provider/add_course_provider.dart';
import '../widget/custom_student_fave_widget.dart';

class StudentRegistrationForm extends StatefulWidget {
  const StudentRegistrationForm({Key? key}) : super(key: key);
  static const String routeName = '/student_registration';

  @override
  State<StudentRegistrationForm> createState() => _StudentRegistrationFormState();
}
bool isObsecure = true;
String? _genderGroupValue;
String? _imagePath;
late Size size;
ImageSource _imageSource = ImageSource.camera;
final transitionType = ContainerTransitionType.fade;
class _StudentRegistrationFormState extends State<StudentRegistrationForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  String? course;
  String? batch;
  final from_key = GlobalKey<FormState>();
  late AddCourseProvider courseprovider;
  late AddBatchProvider  batchProvider;
  String? batches;
  String? courses;
  bool seen = false;
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

  @override
  void didChangeDependencies() {
    courseprovider = Provider.of<AddCourseProvider>(context);
    batchProvider= Provider.of<AddBatchProvider>(context);
    super.didChangeDependencies();
  }
  //List<String> courselist= provider.courselist;
  //List<AddCourseModel> courselist =provider.courselist;
  void initState() {
    courses=courses_list[0];
    batches=batches_list[0];
    if(seen == true){
      floatingActionButton: CustomStudentFABWidget(transitionType: transitionType);      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked;
    } else{
      seen == false;
    }
  }

  @override
  Widget build(BuildContext context) {
    size= MediaQuery.of(context).size;
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Registration Form'),
        backgroundColor: Colors.blueGrey.shade800,
        elevation: 10,
        actions: [
          IconButton(onPressed: (){
            showToast("Saved", gravity: Toast.bottom);
            setState((){
              seen = ! seen;
              _savestudent();
            });
          }, icon: Icon(Icons.save)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: from_key,
          child: ListView(
            children: [
              Visibility(
                visible: seen,
                child : CustomStudentFABWidget(transitionType: transitionType),
              ),
              SizedBox(height: 50,),
              Card(
                shape: CircleBorder(
                    side: BorderSide(
                      color: Colors.amber,
                      width: 2.0,
                    )
                ),
                elevation: 5,
                child: _imagePath == null
                    ? Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('images/student2.jpg'),
                      fit: BoxFit.contain,
                    ),
                  ),
                )
                    : Image.file(
                  File(_imagePath!),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  ElevatedButton(onPressed: (
                      ){
                    _imageSource = ImageSource.camera;
                     _getImage();
                  }, child: Text('Camera')),
                  SizedBox(width: 20,),
                  ElevatedButton(onPressed: (){
                    _imageSource = ImageSource.gallery;
                     _getImage();
                  }, child: Text('Gallery')),
                ],
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person)
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'This field must not be emplty';
                  }
                  if(value.length > 20){
                    return 'Name must be in 20 characters';
                  }
                  else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 10),

              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email)
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'This field must not be emplty';
                  }
                  // if(value.length > 20){
                  //   return 'Name must be in 20 characters';
                  // }
                  else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 10),

             /* TextField(
                // controller: passwordController,
                obscureText: isObsecure,
                decoration: InputDecoration(
                    labelText: 'Password',
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
              ),*/
              SizedBox(height: 10,),

              Card(
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Select Gender'),
                    Radio<String>(
                        value: 'Male',
                        groupValue: _genderGroupValue,
                        onChanged: (value) {
                          setState(() {
                            _genderGroupValue = value;
                          });
                        }),
                    Text('Male'),
                    Radio<String>(
                        value: 'Female',
                        groupValue: _genderGroupValue,
                        onChanged: (value) {
                          setState(() {
                            _genderGroupValue = value;
                          });
                        }),
                    Text('FeMale'),
                  ],
                ),
              ),

              SizedBox(height: 10,),

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
              SizedBox(height: 10,),
              // ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       primary: Colors.grey.shade700,
              //       onPrimary: Colors.white,
              //       elevation: 3,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       padding: EdgeInsets.all(5),
              //     ),
              //     onPressed:(){ _savestudent();}
              //     , child: const Text('Register Student')),

            ],
          ),
        ),
      ),

    );
  }
  void _getImage() async {
    final selectedImage = await ImagePicker().pickImage(source: _imageSource);
    if(selectedImage != null){
      setState((){
        _imagePath = selectedImage.path;
      });
    }
  }
  void _savestudent() async {
    final student = AddStudentModel(
      name:nameController.text,
      email: emailController.text,
      image: _imagePath,
      gender: _genderGroupValue,
      batch: batch,
      course: course
    );
    print(student.toString());
    final status = await Provider
        .of<AddStudentProvider>(context, listen: false)
        .addStudent(student);
    if(status){
      Navigator.pushNamed(context, AdminDashboard.routeName);
    }
  }
  void showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }
}
