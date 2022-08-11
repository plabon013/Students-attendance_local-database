import 'package:flutter/cupertino.dart';
import 'package:student_attendance/model/give_attendence_model.dart';

import '../db/db_helper.dart';

class AttendenceProvider extends ChangeNotifier {
  List<AttendenceModel> attendencelist = [];
  List<String> attendenceIDlistFP = [];
  getAllAttendence() {
    DBHelper.getAllattendence().then((value) {
      attendencelist = value;
    });
   // attendenceIDlistFP.add(attendencelist[0].SIDs!.split(',').toString());
  }

  updateAttendence(int? id, String value){
    DBHelper.updateAttendence(id, value).then((_){
      //contactList[index].favorite = !contactList[index].favorite;
      notifyListeners();
    });
  }

    Future<bool> addAttendence(AttendenceModel attendenceModel) async {
      final rowId = await DBHelper.addattendence(attendenceModel);
      if (rowId > 0) {
        attendenceModel.id = rowId;
        attendencelist.add(attendenceModel);
        notifyListeners();
        return true;
      }
      return false;
    }
  }

