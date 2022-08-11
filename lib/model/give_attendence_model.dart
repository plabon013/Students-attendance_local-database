const String tableAttendence='tbl_attendence';
const String tableAttendenceColId='id';
const String tableAttendenceColSIDs='SIDs';
const String tableAttendenceColDate='date';
const String tableAttendenceColStatus='Status';
const String tableAttendenceColCourse='course';
const String tableAttendenceColBatch='batch';
const String tableAttendenceColTeacher='teacher';

class AttendenceModel{
  int? id;
  String? SIDs;
  String? date;
  String? Status;
  String? teacher;
  String? course;
  String? batch;


  AttendenceModel(
      {this.id,
        this.SIDs,
        this.date,
        this.course,
        this.Status,
        this.teacher,
        this.batch});

  Map<String,dynamic> toMap(){
    var map=<String,dynamic>{
      tableAttendenceColSIDs:SIDs,
      tableAttendenceColStatus:Status,
      tableAttendenceColDate:date,
      tableAttendenceColCourse:course,
      tableAttendenceColBatch:batch,
      tableAttendenceColTeacher:teacher,
    };

    if(id!=null){
      map[tableAttendenceColId]=id;
    }

    return map;
  }
  factory AttendenceModel.fromMap(Map<String, dynamic> map) => AttendenceModel(
      id: map[tableAttendenceColId],
      SIDs: map[tableAttendenceColSIDs],
      Status: map[tableAttendenceColStatus],
      date: map[tableAttendenceColDate],
      course: map[tableAttendenceColCourse],
      batch: map[tableAttendenceColBatch],
      teacher: map[tableAttendenceColTeacher]
  );
}


