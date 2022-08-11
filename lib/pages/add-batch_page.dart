import 'package:flutter/material.dart';
import 'package:student_attendance/model/add_batch_model.dart';
import 'package:student_attendance/model/add_course_model.dart';
import 'package:student_attendance/pages/admin_dashboard.dart';
import 'package:student_attendance/provider/add_batch_provider.dart';
import 'package:student_attendance/provider/add_course_provider.dart';
import 'package:provider/provider.dart';

class AddBatch extends StatefulWidget {
  const AddBatch({Key? key}) : super(key: key);
  static const String routename='/addbatch';

  State<AddBatch> createState() => _AddBatchState();
}

class _AddBatchState extends State<AddBatch> {
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
  final batchaddingController= TextEditingController();
  String? selectedcourse;
  late AddCourseProvider provider;
  String? batches;
  String? courses;
  late AddBatchProvider bprovider;
  late int totalbatches;
  late Size size;
  @override void dispose() {
    batchaddingController.dispose();
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    provider = Provider.of<AddCourseProvider>(context);
    bprovider= Provider.of<AddBatchProvider>(context);
    totalbatches=bprovider.batchlist.length;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    size= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Batch'),
        backgroundColor: Colors.blueGrey.shade800,
        elevation: 10,
      ),
      body: Center(
        child: Container(
          height: size.height / 1.5,
          width:  size.width / 1.5,
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
              Text('$totalbatches Batch Added'),
              Padding(
                padding: const EdgeInsets.all(16.0),
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
                // DropdownButton(
                //   isExpanded: true,
                //   underline:Container(),
                //   // Initial Value
                //   value: courses,
                //   // Down Arrow Icon
                //   icon: const Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                //
                //   // Array list of items
                //   items: provider.courselist.map((String items) {
                //     return DropdownMenuItem(
                //       value: items,
                //       child: new Text(items),
                //     );
                //   }).toList(),
                //   // After selecting the desired option,it will
                //   // change button value to selected value
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       courses = newValue!;
                //       selectedcourse=courses;
                //     });
                //   },
                //   hint: Text('Courses'),
                // ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: batchaddingController,
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
                  onPressed:(){ _saveBatch();}
                  , child: const Text('Add Batch')),
            ],

          ),
        ),
      ),
    );
  }
  void _saveBatch() async {
    final batch = AddBatchModel(
      name:batchaddingController.text,
      course: selectedcourse.toString()
    );
    print(batch.toString());
    final status = await Provider
        .of<AddBatchProvider>(context, listen: false)
        .addNewBatch(batch);
    if(status){
      Navigator.pushNamed(context, AdminDashboard.routeName);
    }
  }
}
