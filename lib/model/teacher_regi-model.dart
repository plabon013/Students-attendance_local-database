const String tableteacher='tbl_teachers';
const String tableteacherColId='id';
const String tableteacherColName='name';
const String tableteacherColEmail='email';
const String tableteacherColPass='password';
const String tableteacherColGender='gender';
const String tableteacherColImage='image';
const String tableteacherColCourse='course';
const String tableteacherColBatch='batch';

class AddTeacherModel{
  int? id;
  String? name;
  String password;
  String email;
  String? gender;
  String? image;
  String? course;
  String? batch;


  AddTeacherModel(
      {this.id,
      this.name,
      required this.password,
      required this.email,
      this.gender,
      this.image,
      this.course,
      this.batch});

  Map<String,dynamic> toMap(){
    var map=<String,dynamic>{
      tableteacherColName:name,
      tableteacherColEmail:email,
      tableteacherColPass:password,
      tableteacherColGender:gender,
      tableteacherColImage:image,
      tableteacherColCourse:course,
      tableteacherColBatch:batch,
    };

    if(id!=null){
      map[tableteacherColId]=id;
    }

    return map;
  }
  factory AddTeacherModel.fromMap(Map<String, dynamic> map) => AddTeacherModel(
    id: map[tableteacherColId],
    name: map[tableteacherColName],
    email: map[tableteacherColEmail],
    password: map[tableteacherColPass],
    image: map[tableteacherColImage],
    gender: map[tableteacherColGender],
    course: map[tableteacherColCourse],
    batch: map[tableteacherColBatch]
  );
}


