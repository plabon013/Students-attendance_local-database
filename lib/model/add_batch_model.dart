const String tableBatch='tbl_batches';
const String tableBatchColId='id';
const String tableBatchColName='name';
const String tableBatchColCourse='course';

class AddBatchModel{
  int? id;
  String name;
  String? course;

  AddBatchModel({this.id,required this.name, this.course});

  Map<String,dynamic> toMap(){
    var map=<String,dynamic>{
      tableBatchColName:name,
      tableBatchColCourse: course
    };

    if(id!=null){
      map[tableBatchColId]=id;
    }

    return map;
  }
  factory AddBatchModel.fromMap(Map<String, dynamic> map) => AddBatchModel(
    id: map[tableBatchColId],
    name: map[tableBatchColName],
    course: map[tableBatchColCourse]
  );
}


