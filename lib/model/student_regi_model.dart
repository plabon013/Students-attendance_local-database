const String tablestudent='tbl_students';
const String tablestudentColId='id';
const String tablestudentColName='name';
const String tablestudentColEmail='email';
const String tablestudentColGender='gender';
const String tablestudentColImage='image';
const String tablestudentColCourse='course';
const String tablestudentColBatch='batch';

class AddStudentModel{
  int? id;
  String name;
  String? email;
  String? gender;
  String? image;
  String? course;
  String? batch;


  AddStudentModel(
      {this.id,
      required this.name,
      this.email,
      this.gender,
      this.image,
      this.course,
      this.batch});

  Map<String,dynamic> toMap(){
    var map=<String,dynamic>{
      tablestudentColName:name,
      tablestudentColEmail:email,
      tablestudentColGender:gender,
      tablestudentColImage:image,
      tablestudentColCourse:course,
      tablestudentColBatch:batch,
    };

    if(id!=null){
      map[tablestudentColId]=id;
    }

    return map;
  }
  factory AddStudentModel.fromMap(Map<String, dynamic> map) => AddStudentModel(
      id: map[tablestudentColId],
      name: map[tablestudentColName],
      email: map[tablestudentColEmail],
      image: map[tablestudentColImage],
      gender: map[tablestudentColGender],
      course: map[tablestudentColCourse],
      batch: map[tablestudentColBatch]
  );
}


