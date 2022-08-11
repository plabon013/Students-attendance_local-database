const String tableCourse='tbl_courses';
const String tableCourseColid='id';
const String tableCourseColName='name';

class AddCourseModel{
  int? id;
  String name;

  AddCourseModel({this.id,required this.name});

  Map<String,dynamic> toMap(){
    var map=<String,dynamic>{
      tableCourseColName:name,
    };

    if(id!=null){
      map[tableCourseColid]=id;
    }

    return map;
  }
  factory AddCourseModel.fromMap(Map<String, dynamic> map) => AddCourseModel(
    id: map[tableCourseColid],
    name: map[tableCourseColName],
  );
}


