import 'package:flutter/foundation.dart';
import 'package:student_attendance/model/student_regi_model.dart';

import '../db/db_helper.dart';
import '../model/student_regi_model.dart';

class AddStudentProvider extends ChangeNotifier {
  List<AddStudentModel> studentlist = [];

  getallStudent() {
    DBHelper.getallStudent().then((value) {
      studentlist = value;
      notifyListeners();
    });
  }
    Future<bool> addStudent(AddStudentModel addStudentModel) async {
      final rowId = await DBHelper.registerStudent(addStudentModel);
      if (rowId > 0) {
        addStudentModel.id = rowId;
        studentlist.add(addStudentModel);
        studentlist.sort((c1, c2) => c1.name.compareTo(c2.name));
        notifyListeners();
        return true;
      }
      return false;
    }
  deleteStudent(int id) async {
    final rowId = await DBHelper.deletestudent(id);
    if(rowId > 0) {
      studentlist.removeWhere((element) => element.id == id);
      notifyListeners();
    }
  }
  }
