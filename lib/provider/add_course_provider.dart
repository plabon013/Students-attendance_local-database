import 'package:flutter/foundation.dart';

import '../db/db_helper.dart';
import '../model/add_course_model.dart';

class AddCourseProvider extends ChangeNotifier {

 List<String> courselist = [];
 List<AddCourseModel> courselist2 = [];
  getallCourse(){
    DBHelper.getAllCourse().then((value){
      courselist2 = value;
      for(int i=0; i<courselist2.length;i++)
      {
        courselist.add(courselist2[i].name);
        print(courselist2.toString());
      }
      notifyListeners();
    });
    print(courselist2.toString());
  }
  Future<bool> addNewCourse(AddCourseModel addCourseModel) async {
    final rowId = await DBHelper.insertcourse(addCourseModel);
    if(rowId > 0) {
      addCourseModel.id = rowId;
      courselist.add(addCourseModel.name);
     // courselist.sort((c1, c2) => c1.name.compareTo(c2.name));
      notifyListeners();
      return true;
    }
    return false;
  }
 deleteCourse(int id, String course) async {
   final rowId = await DBHelper.deletecourse(id);
   DBHelper.deletebatch(course);
   if(rowId > 0) {
     courselist2.removeWhere((element) => element.id == id);
     //courselist.remove(courselist2[id].name);
     notifyListeners();
   }
 }
}