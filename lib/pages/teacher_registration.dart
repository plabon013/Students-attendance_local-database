
import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:student_attendance/model/teacher_regi-model.dart';
import 'package:student_attendance/pages/admin_dashboard.dart';
import 'package:student_attendance/pages/teacher_dashboard.dart';
import 'package:student_attendance/provider/add_course_provider.dart';
import 'package:student_attendance/provider/teacherregi_provider.dart';
import 'package:toast/toast.dart';

import '../provider/add_batch_provider.dart';
import '../widget/custom_fav_widget.dart';
class TeacherRegistrationForm extends StatefulWidget {
  static const String routeName = '/teacher_registration';
  const TeacherRegistrationForm({Key? key}) : super(key: key);

  @override
  State<TeacherRegistrationForm> createState() => _TeacherRegistrationFormState();
}
bool isObsecure = true;
String? _genderGroupValue;
String? _imagePath;
ImageSource _imageSource = ImageSource.camera;

class _TeacherRegistrationFormState extends State<TeacherRegistrationForm> {
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
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late AddCourseProvider courseprovider;
  late AddBatchProvider  batchProvider;
  String? courses;
  String? batches;

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final from_key = GlobalKey<FormState>();
  final transitionType = ContainerTransitionType.fade;
  bool seen = false;
  late Size size;

  @override
  void didChangeDependencies() {
    courseprovider = Provider.of<AddCourseProvider>(context);
    batchProvider = Provider.of<AddBatchProvider>(context);
    super.didChangeDependencies();
  }
  @override
  void initState() {
    courses=courses_list[0];
    batches=batches_list[0];
    if(seen == true){
      floatingActionButton: CustomFABWidget(transitionType: transitionType);
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked;
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
        title: const Text('Teacher Registration Form'),
        actions: [
          IconButton(onPressed: (){
            showToast("Saved", gravity: Toast.bottom);
            setState((){
              seen = ! seen;
            });
          }, icon: Icon(Icons.save)),
        ],
        backgroundColor: Colors.blueGrey.shade800,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: from_key,
          child: ListView(
            children: [
              Visibility(
                visible: seen,
                child : CustomFABWidget(transitionType: transitionType),
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
                      image: AssetImage('images/teacher2.jpg'),
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
                  ElevatedButton(onPressed: (){
                    _imageSource = ImageSource.camera;
                    // _getImage();
                  }, child: Text('Camera')),
                  SizedBox(width: 20,),
                  ElevatedButton(onPressed: (){
                    _imageSource = ImageSource.gallery;
                    // _getImage();
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

              TextField(
                controller: passwordController,
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
              ),
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
              // DropdownButton(
              //   isExpanded: true,
              //   underline:Container(),
              //   value: courses,
              //   icon: const Icon(Icons.keyboard_arrow_down),
              //
              //   items: courseprovider.courselist.map((String items) {
              //     return DropdownMenuItem(
              //       value: items,
              //       child: new Text(items),
              //     );
              //   }).toList(),
              //
              //   onChanged: (String? newValue) {
              //     setState(() {
              //       courses = newValue!;
              //       course=courses;
              //     });
              //   },
              //   hint: Text('Courses'),
              // ),
              SizedBox(height: 10,),
              // DropdownButton(
              //   isExpanded: true,
              //   underline:Container(),
              //   // Initial Value
              //   value: batches,
              //
              //   // Down Arrow Icon
              //   icon: const Icon(Icons.keyboard_arrow_down),
              //
              //   // Array list of items
              //   items: batchProvider.batchlist.map((String items) {
              //     return DropdownMenuItem(
              //       value: items,
              //       child: new Text(items),
              //     );
              //   }).toList(),
              //   // After selecting the desired option,it will
              //   // change button value to selected value
              //   onChanged: (String? newValue) {
              //     setState(() {
              //       batches = newValue!;
              //       batch=batches;
              //     });
              //   },
              //   hint: Text('Batch'),
              // ),
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
              //     onPressed:(){ _saveteacher();}
              //     , child: const Text('Register')),

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
  void _saveteacher() async {
    final teacher = AddTeacherModel(
      name:nameController.text,
      email: emailController.text,
      password: passwordController.text,
      image: _imagePath,
      gender: _genderGroupValue,
      batch: batches,
      course: courses
    );
    print(teacher.toString());
    final status = await Provider
        .of<AddTeacherProvider>(context, listen: false)
        .addTeacher(teacher);
    if(status){
      Navigator.pushNamed(context, AdminDashboard.routeName);
    }
  }
  void showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }
}
