import 'package:flutter/foundation.dart';

import '../db/db_helper.dart';
import '../model/teacher_regi-model.dart';

class AddTeacherProvider extends ChangeNotifier {
  List<AddTeacherModel> teacherlist = [];
  List<String> teachermaillist=[];
  List<String> teacherpasswordlist=[];

  getAllTeacher(){
    DBHelper.getAllTeacher().then((value){
      teacherlist = value;
      for(int i=0; i<teacherlist.length;i++)
      {
        //  courselist[i]=courselist2[i].name;
        teachermaillist.add(teacherlist[i].email);
        teacherpasswordlist.add(teacherlist[i].password);
      }
    });
  }
  Future<bool> addTeacher(AddTeacherModel addTeacherModel) async {
    final rowId = await DBHelper.registerTeacher(addTeacherModel);
    if(rowId > 0) {
      addTeacherModel.id = rowId;
      teacherlist.add(addTeacherModel);
      teacherlist.sort((c1, c2) => c1.email.compareTo(c2.email));
      notifyListeners();
      return true;
    }
    return false;
  }
  deleteTrainer(int id) async {
    final rowId = await DBHelper.deletetrainer(id);
    if(rowId > 0) {
      teacherlist.removeWhere((element) => element.id == id);
      notifyListeners();
    }
  }

}