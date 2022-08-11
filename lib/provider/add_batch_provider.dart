import 'package:flutter/foundation.dart';
import 'package:student_attendance/model/add_batch_model.dart';

import '../db/db_helper.dart';

class AddBatchProvider extends ChangeNotifier {

  List<String> batchlist = [];
  List<AddBatchModel> batchlist2 = [];
  getallBatch(){
    DBHelper.getAllbatch().then((value){
      batchlist2 = value;
      print(batchlist2.toString());
      for(int i=0; i<batchlist2.length;i++)
      {
        batchlist.add(batchlist2[i].name);
        print(batchlist2.length);
      }
      notifyListeners();
    });

  }
  Future<bool> addNewBatch(AddBatchModel addBatchModel) async {
    final rowId = await DBHelper.insertbatch(addBatchModel);
    if(rowId > 0) {
      addBatchModel.id = rowId;
      batchlist.add(addBatchModel.name);
      notifyListeners();
      return true;
    }
    return false;
  }

}